<template>
  <div class="login-page">
    <div class="login-box">
      <div class="logo">
        <h1 v-if="$route.query.isHuaOrQih == '1'">Customer</h1>
        <h1 v-else>Artist</h1>
      </div>
      <el-upload class="avatar-uploader" action="http://localhost:8080/springbootiymihuashi//api/files/upload/"
                 :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
        <el-form-item prop="name">
          <el-input v-model="ruleForm.name" placeholder="Name"></el-input>
        </el-form-item>
        <el-form-item prop="surname">
          <el-input v-model="ruleForm.surname" placeholder="Surname"></el-input>
        </el-form-item>
        <el-form-item prop="signName">
          <el-input v-model="ruleForm.signName" placeholder="Sign name"></el-input>
        </el-form-item>
        <el-form-item prop="bankNumber">
          <el-input v-model="ruleForm.bankNumber" placeholder="Bank number "></el-input>
        </el-form-item>
        <el-form-item prop="serviceBank">
          <el-input v-model="ruleForm.serviceBank" placeholder="Service bank "></el-input>
        </el-form-item>
        <el-form-item prop="bankName">
          <el-input v-model="ruleForm.bankName" placeholder="Bank name  "></el-input>
        </el-form-item>
        <el-form-item prop="nationalId">
          <el-input v-model="ruleForm.nationalId" placeholder="National ID"></el-input>
        </el-form-item>
        <el-form-item prop="portfolioLink">
          <el-input v-model="ruleForm.portfolioLink" placeholder="Porforio link"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button style="width: 100%;" type="primary" @click="submitForm('ruleForm', '1')">save</el-button>
        </el-form-item>
      </el-form>
    </div>

  </div>
</template>

<script>
import { register } from '@/api/userVerification'
export default {
  name: 'userInfo',
  data() {
    return {
      ruleForm: {
        name: '',
        surname: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        portfolioLink: ''
      },
      rules: {
        name: [
          {required: true, message: 'Not filled', trigger: 'blur'},
        ],
        surname: [
          {required: true, message: 'Not filled', trigger: 'blur'},
        ],
        signName: [
          {required: true, message: 'Not filled', trigger: 'blur'},
        ],
        bankNumber: [
          { required: true, message: 'Not filled', trigger: 'blur' },
        ],
        serviceBank: [
          { required: true, message: 'Not filled', trigger: 'blur' },
        ],
        bankName: [
          { required: true, message: 'Not filled', trigger: 'blur' },
        ],
        nationalId: [
          { required: true, message: 'Not filled', trigger: 'blur' },
        ],
        portfolioLink: [
          { required: true, message: 'Not filled', trigger: 'blur' },
        ],
      },
      imageUrl: 'http://localhost:8082/img/user.f00823e5.png'
    }
  },
  methods: {
    handleAvatarSuccess(res, file) {

      this.imageUrl = res.fileDownloadUri;
    },
    beforeAvatarUpload(file) {

      const isLt2M = file.size / 1024 / 1024 < 9;

      if (!isLt2M) {
        this.$message.error('The size of the uploaded avatar image cannot exceed 9MB!');
      }

      return isLt2M;
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // Obtain parameters for the browser request path
          const params = this.$route.query
          this.ruleForm.userName = params.userName
          this.ruleForm.password = params.password
          this.ruleForm.role = params.isHuaOrQih
          this.ruleForm.avatar = this.imageUrl
          register(this.ruleForm).then(res => {
            if(res.code==200||res.code==0){
              this.$message({
                message: 'Saved successfully',
                type: 'success'
              });
              this.$router.push('/login')
            }else{
              this.$message({
                message: res.msg,
                type: 'error'
              });
            }

          })

          // this.$router.push('/login')
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
  }
}
</script>

<style scoped lang="scss">
.login-page {
  display: flex;
  height: 100%;
  background-color: #e6eaee;
  padding-top: 50px;
}

.login-box {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  width: 450px;
  margin: auto;
  margin-bottom: 0;
  background: rgb(255, 255, 255);
  border-radius: 8px;
  box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 8px;
  padding: 60px 50px;

  .logo {
    margin-bottom: 50px;
    text-align: center;
  }

  .register {
    margin: 20px 0;
    color: #00a8e9;
    font-size: 14px;
  }

  .form-footer {
    width: 100%;
    margin-top: 20px;
    font-size: 14px;
    color: #00a8e9;
    text-align: center;
  }

  .el-menu-item {
    width: 50%;
    text-align: center;
    margin-bottom: 20px;
  }
}

.avatar-uploader {
  text-align: center;
  margin-bottom: 10px;
}

.el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  border: 1px solid #ccc;
  border-radius: 50%;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
