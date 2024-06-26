<template>
    <div class="login-page">
        <div class="login-box">
            <div class="logo">
                <h1>Customer</h1>
            </div>
            <router-link to="/register" class="register">Not register yet</router-link>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
                <el-form-item prop="name">
                    <el-input v-model="ruleForm.name" placeholder="Nickname/E-meail/Phone Number"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input type="password" v-model="ruleForm.password" placeholder="Password"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button style="width: 100%;" type="primary" @click="submitForm('ruleForm', '1')">Log
                        in</el-button>
                </el-form-item>
            </el-form>
            <div class="form-footer">

                <router-link to="">Forget Password</router-link>
            </div>
        </div>
        <div class="login-box">
            <div class="logo">
                <h1>Artist</h1>
            </div>
            <router-link to="/register" class="register">Not register yet</router-link>
            <el-form :model="ruleForm1" :rules="rules" ref="ruleForm1" class="demo-ruleForm">
                <el-form-item prop="name">
                    <el-input v-model="ruleForm1.name" placeholder="Nickname/E-meail/Phone Number"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input type="password" v-model="ruleForm1.password" placeholder="Password"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button style="width: 100%;" type="primary" @click="submitForm('ruleForm1', '2')">Log
                        in</el-button>
                </el-form-item>
            </el-form>
            <div class="form-footer">
                <router-link to="">Forget Password</router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Login',
    data() {
        return {
            ruleForm: {
                name: 'admin',
                password: '123456',
            },
            ruleForm1: {
                name: 'admin1',
                password: '123456',
            },
            rules: {
                name: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ]
            }
        }
    },
    methods: {
        submitForm(formName, n) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    this.$message({
                        message: '登陆成功',
                        type: 'success'
                    });
                    this.$router.push({ path: '/home/userhome', query: { isHuaOrQih: n } })
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
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
</style>