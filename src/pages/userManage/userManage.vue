<template>
  <div>
    <Header/>
    <main>
      <div class="user-management">
        <el-card>
          <div slot="header">
            <span>User management</span>
          </div>

          <el-form :inline="true" :model="searchForm" class="demo-form-inline">
            <el-form-item>
              <el-input v-model="searchForm.keyword" placeholder="Please enter keywords to search"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="handleSearch">Search</el-button>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="handleAdd">New User</el-button>
            </el-form-item>
          </el-form>

          <el-table :data="tableData" style="width: 100%">
            <el-table-column prop="id" label="ID"></el-table-column>
            <el-table-column prop="userName" label="user name"></el-table-column>
            <el-table-column prop="name" label="name"></el-table-column>
            <el-table-column prop="surname" label="surname"></el-table-column>
            <el-table-column prop="role" label="role">
              <template slot-scope="scope">
                {{ getRoleName(scope.row.role) }}
              </template>
            </el-table-column>
            <el-table-column prop="signName" label="sign name"></el-table-column>
            <el-table-column prop="nationalId" label="natinal id"></el-table-column>
            <el-table-column label="operation" width="250">
              <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">Edit</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.row)">Delete</el-button>
                <el-button size="mini" type="warning" @click="handleResetPassword(scope.row)">Reset password </el-button>
              </template>
            </el-table-column>
          </el-table>

          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="currentPage"
              :page-sizes="[10, 20, 50, 100]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
          </el-pagination>

          <el-dialog :title="dialogTitle" :visible.sync="dialogVisible">
            <el-form :model="form" :rules="rules" ref="form" label-width="120px">
              <el-form-item label="username" prop="userName">
                <el-input v-model="form.userName" :disabled="isEdit"></el-input>
              </el-form-item>
              <el-form-item label="role" prop="role">
                <el-select v-model="form.role" :disabled="isEdit" placeholder="Please choose">
                  <el-option label="Customer" value="1"></el-option>
                  <el-option label="Artist" value="2"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="Nmae" prop="name">
                <el-input v-model="form.name"></el-input>
              </el-form-item>
              <el-form-item label="surname" prop="surname">
                <el-input v-model="form.surname"></el-input>
              </el-form-item>
              <el-form-item label="sign name" prop="signName">
                <el-input v-model="form.signName"></el-input>
              </el-form-item>
              <el-form-item label="bank number" prop="bankNumber">
                <el-input v-model="form.bankNumber"></el-input>
              </el-form-item>
              <el-form-item label="service Bank" prop="serviceBank">
                <el-input v-model="form.serviceBank"></el-input>
              </el-form-item>
              <el-form-item label="bank name" prop="bankName">
                <el-input v-model="form.bankName"></el-input>
              </el-form-item>
              <el-form-item label="national Id" prop="nationalId">
                <el-input v-model="form.nationalId"></el-input>
              </el-form-item>
              <el-form-item label="introduction" prop="introduction">
                <el-input type="textarea" v-model="form.introduction"></el-input>
              </el-form-item>
              <el-form-item label="portfolioLink" prop="portfolioLink">
                <el-input v-model="form.portfolioLink"></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">Cancel</el-button>
              <el-button type="primary" @click="handleSubmit">Determine</el-button>
            </div>
          </el-dialog>
        </el-card>
      </div>
    </main>
  </div>
</template>

<script>
import {getPage, save, updateUser, deleteUsers, resetPassword} from '@/api/user'
import Header from "@/pages/Header/Header.vue";

export default {
  components: {Header},
  data() {
    return {
      searchForm: {
        keyword: ''
      },
      tableData: [],
      currentPage: 1,
      pageSize: 10,
      total: 0,
      dialogVisible: false,
      dialogTitle: '',
      isEdit: false,
      form: {
        id: '',
        userName: '',
        role: '',
        name: '',
        surname: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        introduction: '',
        portfolioLink: '',
      },
      rules: {
        userName: [{required: true, message: 'Enter one user name', trigger: 'blur'}],
        role: [{required: true, message: 'Please select a role', trigger: 'change'}],
        name: [{required: true, message: 'Please enter name', trigger: 'blur'}],
        surname: [{required: true, message: 'Please enter surname', trigger: 'blur'}],
        signName: [{required: true, message: 'Please enter signature', trigger: 'blur'}],
        bankNumber: [{required: true, message: 'Please enter bank card number', trigger: 'blur'}],
        serviceBank: [{required: true, message: 'Please enter the service bank', trigger: 'blur'}],
        bankName: [{required: true, message: 'Please enter the bank name', trigger: 'blur'}],
        nationalId: [{required: true, message: 'Please enter ID number number', trigger: 'blur'}],
        introduction: [{required: true, message: 'Please enter personal profile', trigger: 'blur'}],
        portfolioLink: [{required: true, message: 'Please enter the portfolio link', trigger: 'blur'}],
      }
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    async fetchData() {
      const params = {
        page: this.currentPage,
        limit: this.pageSize,
        keyword: this.searchForm.keyword
      }
      const res = await getPage(params)
      if(res.code !== 200 && res.code !== 0) return this.$message.error(res.msg)
      this.tableData = res.data.records
      this.total = res.data.total
    },
    handleSearch() {
      this.currentPage = 1
      this.fetchData()
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.fetchData()
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.fetchData()
    },
    handleAdd() {
      this.dialogTitle = 'New User'
      this.isEdit = false
      this.form = {
        id: '',
        userName: '',
        role: '',
        name: '',
        surname: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        introduction: '',
        portfolioLink: '',
      }
      this.dialogVisible = true
      this.$nextTick(() => {
        this.$refs.form.clearValidate()
      })
    },
    handleEdit(row) {
      this.dialogTitle = 'Edit user'
      this.isEdit = true
      this.form = {...row}
      this.dialogVisible = true
      this.$nextTick(() => {
        this.$refs.form.clearValidate()
      })
    },
    async handleDelete(row) {
      try {
        await this.$confirm('Confirm to delete the user?', 'Tipas', {
          confirmButtonText: 'Determine',
          cancelButtonText: 'Cancel',
          type: 'warning'
        })
        await deleteUsers([row.id])
        this.$message.success('Delete successfully')
        this.fetchData()
      } catch (error) {
        console.error(error)
      }
    },
    async handleResetPassword(row) {
      try {
        await this.$confirm('Confirm password reset?', 'Tips', {
          confirmButtonText: 'Determine',
          cancelButtonText: 'Cancel',
          type: 'warning'
        })
        const params = {
          userName: row.userName
        }
        await resetPassword(params)
        this.$message.success('Password has been reset to：123456')
      } catch (error) {
        console.error(error)
      }
    },
    async handleSubmit() {
      this.$refs.form.validate(async (valid) => {
        if (valid) {
          try {
            if (this.dialogTitle === 'Add user') {
              await save(this.form)
            } else {
              await updateUser(this.form)
            }
            this.$message.success(this.dialogTitle + 'Success, default password123456')
            this.dialogVisible = false
            this.fetchData()
          } catch (error) {
            console.error(error)
          }
        } else {
          return false
        }
      })
    },
    getRoleName(role) {
      const roleMap = {
        '1': 'Customer',
        '2': 'Artist'
      }
      return roleMap[role] || 'Guest'
    }
  }
}
</script>


<style scoped>
.user-management {
  padding: 20px;
}

main {
  padding: 150px 100px;
  background-color: #fff;

  ul {
    display: flex;
    justify-content: space-between;

    li {
      img {
        width: 178px;
        height: 178px;
        border: 1px solid #eee;
        border-radius: 5px;
        transition: .2s;
      }

      &:hover {
        box-shadow: 0 0 10px #dbd9d9;
      }
    }
  }

  .hsbox {
    display: flex;
    align-items: center;
    margin-right: 20px;

    img {
      width: 64px;
      height: 64px;
      border-radius: 50%;
      margin-right: 20px;
    }

    &:hover {
      box-shadow: none;
    }

    p {
      margin-bottom: 10px;
      font-size: 14px;
      color: #555;
    }
  }
}
</style>
