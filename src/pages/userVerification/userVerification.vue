<template>
  <div>
    <Header />
    <main>

      <div class="user-verification-management">
        <el-card>
          <div slot="header">
            <span>User authentication management</span>
          </div>

          <div style="margin-bottom: 20px;">
            <el-input
                v-model="keyword"
                placeholder="Please enter search keywords"
                style="width: 200px;"
                @keyup.enter.native="handleSearch"
            >
              <el-button slot="append" icon="el-icon-search" @click="handleSearch"></el-button>
            </el-input>
          </div>

          <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="80"></el-table-column>
            <el-table-column prop="userName" label="user name"></el-table-column>
            <el-table-column prop="surname" label="surname"></el-table-column>
            <el-table-column prop="role" label="role">
              <template slot-scope="scope">
                {{ getRoleText(scope.row.role) }}
              </template>
            </el-table-column>
            <el-table-column prop="status" label="state">
              <template slot-scope="scope">
                <el-tag :type="getStatusType(scope.row.status)">
                  {{ getStatusText(scope.row.status) }}
                </el-tag>
              </template>
            </el-table-column>

            <el-table-column label="operation" width="300">
              <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">Edit</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.row)">Cancel</el-button>
                <el-button size="mini" type="success" @click="handleAudit(scope.row)" v-if="scope.row.status === 0">
                  Examine
                </el-button>
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
        </el-card>

        <!-- Add/Edit dialog box -->
        <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="50%">
          <el-form :model="form" label-width="120px">
            <el-form-item label="user name">
              <el-input v-model="form.userName"></el-input>
            </el-form-item>
            <el-form-item label="password" v-if="dialogTitle === 'add user'">
              <el-input v-model="form.password" type="password"></el-input>
            </el-form-item>
            <el-form-item label="surname">
              <el-input v-model="form.surname"></el-input>
            </el-form-item>
            <el-form-item label="signname">
              <el-input v-model="form.signName"></el-input>
            </el-form-item>
            <el-form-item label="bank account number">
              <el-input v-model="form.bankNumber"></el-input>
            </el-form-item>
            <el-form-item label="service bank">
              <el-input v-model="form.serviceBank"></el-input>
            </el-form-item>
            <el-form-item label="bank name">
              <el-input v-model="form.bankName"></el-input>
            </el-form-item>
            <el-form-item label="national id">
              <el-input v-model="form.nationalId"></el-input>
            </el-form-item>
            <el-form-item label="portfolioLink">
              <el-input v-model="form.portfolioLink"></el-input>
            </el-form-item>
            <el-form-item label="role">
              <el-select v-model="form.role" placeholder="Please select a role">
                <el-option label="admin" value="admin"></el-option>
                <el-option label="customer" value="user"></el-option>
              </el-select>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">Cancel</el-button>
            <el-button type="primary" @click="submitForm">Determine</el-button>
          </span>
        </el-dialog>

        <!-- Audit dialog box -->
        <el-dialog title="Review users" :visible.sync="auditDialogVisible" width="30%">
          <el-form :model="auditForm">
            <el-form-item label="Audit result ">
              <el-radio-group v-model="auditForm.status">
                <el-radio :label="1">adopt</el-radio>
                <el-radio :label="2">Not approved</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="auditDialogVisible = false">Cancel</el-button>
            <el-button type="primary" @click="submitAudit">Determine</el-button>
          </span>
        </el-dialog>
      </div>
    </main>
  </div>
</template>

<script>
import {getPage, register, update, deleteUsers, audit} from '@/api/userVerification'
import Header from "@/pages/Header/Header.vue";

export default {
  components: {Header},
  data() {
    return {
      tableData: [],
      currentPage: 1,
      pageSize: 10,
      total: 0,
      dialogVisible: false,
      dialogTitle: '',
      form: {
        id: null,
        userName: '',
        password: '',
        surname: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        portfolioLink: '',
        role: ''
      },
      auditDialogVisible: false,
      auditForm: {
        id: null,
        status: 1
      },
      keyword: ''
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    getStatusType(status) {
      switch (status) {
        case 0:
          return 'info'
        case 1:
          return 'success'
        case 2:
          return 'danger'
        default:
          return 'warning'
      }
    },
    getRoleText(role) {
      switch (role) {
        case '1':
          return 'Customer'
        case '2':
          return 'Artist'
        default:
          return 'Guest'
      }
    },
    getStatusText(status) {
      switch (status) {
        case 0:
          return 'Unaudited'
        case 1:
          return 'Reviewed'
        case 2:
          return 'Rejected'
        default:
          return 'Unknown state'
      }
    },
    fetchData() {
      getPage({
        page: this.currentPage,
        limit: this.pageSize,
        keyword: this.keyword
      }).then(response => {
        if(response.code !== 200 && response.code !== 0) {
          this.$message.error(response.msg)
          return
        }
        const {data} = response
        this.tableData = data.records
        this.total = data.total
      })
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.currentPage = 1
      this.fetchData()
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.fetchData()
    },
    handleAdd() {
      this.dialogTitle = 'Add user'
      this.form = {
        id: null,
        userName: '',
        password: '',
        surname: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        portfolioLink: '',
        role: ''
      }
      this.dialogVisible = true
    },
    handleEdit(row) {
      this.dialogTitle = 'Edit user'
      this.form = {...row}
      this.dialogVisible = true
    },
    handleDelete(row) {
      this.$confirm('Confirm to delete the user?', 'Tips', {
        confirmButtonText: 'Determine',
        cancelButtonText: 'Cancel',
        type: 'warning'
      }).then(() => {
        deleteUsers([row.id]).then(() => {
          this.$message.success('Delete successfully')
          this.fetchData()
        })
      }).catch(() => {
      })
    },
    handleAudit(row) {
      this.auditForm.id = row.id
      this.auditDialogVisible = true
    },
    submitForm() {
      if (this.dialogTitle === 'Add user') {
        register(this.form).then(() => {
          this.$message.success('Added successfully')
          this.dialogVisible = false
          this.fetchData()
        })
      } else {
        update(this.form).then(() => {
          this.$message.success('Update successful')
          this.dialogVisible = false
          this.fetchData()
        })
      }
    },
    submitAudit() {
      audit(this.auditForm).then(() => {
        this.$message.success('Audit successful')
        this.auditDialogVisible = false
        this.fetchData()
      })
    },
    handleSearch() {
      this.currentPage = 1
      this.fetchData()
    }
  }
}
</script>

<style scoped>
.user-verification-management {
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
