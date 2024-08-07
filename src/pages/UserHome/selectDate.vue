<template>
  <div class="multi-date-picker">
    <div class="calendar-header">
      <el-button @click="changeMonth(-1)">&lt;</el-button>
      <span>{{ currentMonthYear }}</span>
      <el-button @click="changeMonth(1)">&gt;</el-button>
    </div>
    <el-calendar v-model="currentDate">
      <template slot="dateCell" slot-scope="{date, data}">
        <div
            class="date-cell"
            :class="{
              'is-selected': isSelected(data.day),
              'is-disabled': isDisabled(data.day),
              'is-readonly': readOnly
            }"
            @click="toggleDate(data.day)"
        >
          {{ data.day.split('-')[2] }}
        </div>
      </template>
    </el-calendar>
    <div class="selected-dates">
      <div class="selected-dates-header">
        <h3>Unpredictable dates:</h3>
        <el-button
            type="danger"
            size="small"
            @click="clearAllDates"
            :disabled="selectedDates.length === 0 || readOnly"
        >
          Clear All
        </el-button>
      </div>
      <el-tag
          v-for="date in selectedDates"
          :key="date"
          :closable="!readOnly"
          @close="removeDate(date)"
      >
        {{ date }}
      </el-tag>
    </div>
  </div>
</template>

<script>
import { saveArtistNoDate, deleteArtistNoDateByDate, deleteArtistNoDateByUserId, getArtistNoDateList } from '@/api/artistNoDate'
import {nextTick} from "vue";

export default {
  name: 'MultiDatePicker',
  props: {
    readOnly: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      currentDate: new Date(),
      selectedDates: [],
      today: new Date().toISOString().split('T')[0]
    }
  },
  computed: {
    currentMonthYear() {
      const options = { year: 'numeric', month: 'long' };
      return this.currentDate.toLocaleDateString(undefined, options);
    }
  },
  created() {
    this.reloadData();
  },
  methods: {
    async reloadData(){
      try {
        const response = await getArtistNoDateList();
        if(response.code=== 200||response.code=== 0){
          let arr = []
          response.data.forEach(item => {
            arr.push(item.noDate)
          })
          this.selectedDates = arr.filter(date => date >= this.today);
        }
        // if (response.data && Array.isArray(response.data)) {
        //
        //   this.selectedDates = response.data
        //       .map(item => new Date(item.noDate).toISOString().split('T')[0])
        //       .filter(date => date >= this.today);
        // }
      } catch (error) {
        console.error('Failed to load dates:', error);
      }
      this.$forceUpdate();
    },
    isSelected(day) {
      return this.selectedDates.includes(day);
    },
    isDisabled(day) {
      return day < this.today;
    },
    async toggleDate(day) {
      if (this.isDisabled(day) || this.readOnly) return;

      const index = this.selectedDates.indexOf(day);
      if (index === -1) {
        try {
          await saveArtistNoDate({ noDate: day });
          this.selectedDates.push(day);
        } catch (error) {
          console.error('Failed to save date:', error);
        }
      } else {
        try {
          await deleteArtistNoDateByDate({ noDate: day });
          this.selectedDates.splice(index, 1);
        } catch (error) {
          console.error('Failed to delete date:', error);
        }
      }
      this.$emit('update:selectedDates', this.selectedDates);
    },
    async removeDate(date) {
      if (this.readOnly) return;

      try {
        await deleteArtistNoDateByDate({ noDate: date });
        const index = this.selectedDates.indexOf(date);
        if (index !== -1) {
          this.selectedDates.splice(index, 1);
        }
        this.$emit('update:selectedDates', this.selectedDates);
      } catch (error) {
        console.error('Failed to remove date:', error);
      }
    },
    changeMonth(delta) {
      const newDate = new Date(this.currentDate);
      newDate.setMonth(newDate.getMonth() + delta);
      this.currentDate = newDate;
    },
    async clearAllDates() {
      if (this.readOnly) return;

      try {
        await deleteArtistNoDateByUserId();
        this.selectedDates = [];
        this.$emit('update:selectedDates', this.selectedDates);
      } catch (error) {
        console.error('Failed to clear all dates:', error);
      }
    }
  }
}
</script>




<style lang="scss">
.multi-date-picker {
  width: 100%;
  max-width: 800px;
  margin: 0 auto;

  .calendar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  .el-calendar {
    .el-calendar__body {
      padding: 0;
    }

    .el-calendar-table {
      th {
        text-align: center;
      }
    }

    .date-cell {
      height: 32px;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;

      &.is-selected {
        color: #fff;
        background-color: #FF4949;
        border-radius: 50%;
      }

      &.is-disabled,
      &.is-readonly {
        color: #C0C4CC;
        cursor: not-allowed;
      }
    }
  }

  .selected-dates {
    margin-top: 20px;

    .selected-dates-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    .el-tag {
      margin-right: 10px;
      margin-bottom: 10px;
      background-color: #FF4949;
      border-color: #FF4949;
      color: #fff;
    }
  }
}
</style>
