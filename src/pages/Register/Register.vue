<template>
    <div class="login-page">
        <div class="login-box">


            <el-menu :default-active="menuActive" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                <el-menu-item index="1">I am a Customer</el-menu-item>
                <el-menu-item index="2">I am an Artist</el-menu-item>
            </el-menu>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="demo-ruleForm">
                <el-form-item prop="name">
                    <el-input v-model="ruleForm.name" placeholder="Nickname"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input type="password" v-model="ruleForm.password" placeholder="Password"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-col :span="6">
                        <el-form-item prop="phone">
                            <el-select value="+86">
                                <el-option label="+66(Thailand)" value="+66"></el-option>
                                <el-option label="+66(Thailand)" value="+66"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="18">
                        <el-form-item>
                            <el-input v-model="ruleForm.phone"
                                placeholder="Mobile number, only used for SMS notifications"></el-input>
                        </el-form-item>
                    </el-col>
                </el-form-item>
                <el-form-item prop="phoneCode">
                    <el-col :span="18">
                        <el-form-item>
                            <el-input v-model="ruleForm.phoneCode" placeholder="Verification code"></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="6">
                        <el-button style="color: #00a8e9;">Obtain verification code</el-button>
                    </el-col>

                </el-form-item>
                <el-form-item>
                    <p>Please confirm that you have agreed<span style="color: #00a8e9;">《Pre use agreement》</span></p>
                </el-form-item>
                <el-form-item>
                    <el-button style="width: 100%;" type="primary" @click="submitForm('ruleForm')">Register</el-button>
                </el-form-item>
            </el-form>
            <div class="form-footer">
                <router-link to="/login">Existing account, go log in</router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Register',
    data() {
        return {
            menuActive: '1',
            ruleForm: {
                name: '',
                password: '',
                phone: '',
                phoneCode: ''
            },
            rules: {
                name: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ],
                password: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ],
                phone: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ],
                phoneCode: [
                    { required: true, message: 'Not filled', trigger: 'blur' },
                ]
            }
        }
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    this.$message({
                        message: '注册成功，请填写用户信息',
                        type: 'success'
                    });
                    this.$router.push('/userInfo')
                    this.$router.push({ path: '/userInfo', query: { isHuaOrQih: this.menuActive } })
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

        img {
            height: 56px;
        }
    }

    .form-footer {
        width: 100%;
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #00a8e9;
    }

    .el-menu-item {
        width: 50%;
        text-align: center;
        margin-bottom: 20px;
    }

}
</style>