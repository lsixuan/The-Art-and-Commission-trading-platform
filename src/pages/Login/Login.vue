<template>
    <div class="login-page">
        <div class="login-box">
            <div class="logo">
                <h2 v-show="menuActive == '1'">Customer</h2>
                <h2 v-show="menuActive == '2'">Artist</h2>
            </div>
            <el-menu :default-active="menuActive" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                <el-menu-item index="1">I am a Customer</el-menu-item>
                <el-menu-item index="2">I am an Artist</el-menu-item>
            </el-menu>

            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
                <el-form-item prop="userName">
                    <el-input v-model="ruleForm.userName" placeholder="Nickname/E-meail/Phone Number"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input type="password" v-model="ruleForm.password" placeholder="Password"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button style="width: 100%;margin-bottom: 20px" type="primary" @click="submitForm('ruleForm', '1')">Log in</el-button>

                  <el-button style="width: 100%;margin-left: 0px" type="primary" @click="gotoArtists()">guest</el-button>
                </el-form-item>
            </el-form>
            <div class="form-footer">
                <router-link to="/register" class="register">Not register yet</router-link>

            </div>
        </div>
    </div>
</template>

<script>
import {getCurrentUser, login} from '@/api/user'
export default {
    name: 'Login',
    data() {
        return {
            menuActive: '1',
            ruleForm: {
                userName: '12',
                password: '123456',
            },
            rules: {
              userName: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ]
            }
        }
    },
    methods: {
        gotoArtists(){
          // set
          this.$storage.set("role", 3);
          const userInfo = {
            role: 3,
            avatar: 'http://localhost:8082/img/user.f00823e5.png',
          }
          this.$storage.set("currentUser", userInfo);
          this.$router.push({path: '/artists'})
        },
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                  this.ruleForm.role = this.menuActive
                  login(this.ruleForm).then(res => {

                    if (res.code == 200 || res.code == 0) {
                      // set token
                      this.$storage.set("Token", res.token);
                      this.$storage.set("role", 0);
                      this.$message({
                        message: 'Login successful',
                        type: 'success'
                      });
                      getCurrentUser().then(res => {
                        this.$router.push({ path: '/home/userhome', query: { isHuaOrQih: this.menuActive } })

                        this.$storage.set("currentUser", res.data);
                      })

                    }else{
                      this.$message({
                        message: res.msg,
                        type: 'error'
                      });
                    }

                  })


                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        handleSelect(key, keyPath) {
            this.menuActive = key
        }
    }
}
</script>

<style scoped lang="scss">
.login-page {
    display: flex;
    justify-content: center;
    height: 100%;
    background-color: #e6eaee;
    padding-top: 50px;
}

.login-box {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    width: 450px;
    margin: 0 50px;
    margin-bottom: 0;
    background: rgb(255, 255, 255);
    border-radius: 8px;
    box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 8px;
    padding: 60px 50px;

    .logo {
        margin-bottom: 50px;
        text-align: center;
    }

    .form-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
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

    .el-menu.el-menu--horizontal {
        border: 0;
    }
}
</style>
