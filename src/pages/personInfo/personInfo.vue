<template>
  <el-card class="user-profile">
    <div class="background-image">
      <img :src="user.homepageBackground" alt="Background">
      <el-upload
          class="background-uploader"
          action="http://localhost:8080/springbootiymihuashi/api/files/upload/"
          :show-file-list="false"
          :on-success="handleBackgroundSuccess"
          :before-upload="beforeImageUpload"
      >
        <el-button size="small" type="primary">Change background</el-button>
      </el-upload>
    </div>

    <div class="user-info">
      <div class="avatar-container">
        <el-avatar :size="100" :src="user.avatar"></el-avatar>
        <el-upload
            class="avatar-uploader"
            action="http://localhost:8080/springbootiymihuashi/api/files/upload/"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeImageUpload"
        >
          <el-button size="small">change the avatar</el-button>
        </el-upload>
      </div>

      <el-form :model="user" label-width="100px" class="user-form">
        <el-form-item label="user name">
          <el-input v-model="user.userName" disabled></el-input>
        </el-form-item>
        <el-form-item label="surname">
          <el-input v-model="user.surname"></el-input>
        </el-form-item>
        <el-form-item label="name">
          <el-input v-model="user.name"></el-input>
        </el-form-item>
        <el-form-item label="sign name">
          <el-input v-model="user.signName"></el-input>
        </el-form-item>
        <el-form-item label="bank account">
          <el-input v-model="user.bankNumber"></el-input>
        </el-form-item>
        <el-form-item label="service bank">
          <el-input v-model="user.serviceBank"></el-input>
        </el-form-item>
        <el-form-item label="bank name">
          <el-input v-model="user.bankName"></el-input>
        </el-form-item>
        <el-form-item label="national Id">
          <el-input v-model="user.nationalId"></el-input>
        </el-form-item>
        <el-form-item label="Personal Profile">
          <el-input type="textarea" v-model="user.introduction"></el-input>
        </el-form-item>
        <el-form-item label="Portfolio link">
          <el-input v-model="user.portfolioLink"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="updateUserInfo">Save modifications</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-card>
</template>

<script>
import { getCurrentUser, updateUser } from '@/api/user'

export default {
  data() {
    return {
      user: {
        userName: '',
        surname: '',
        name: '',
        signName: '',
        bankNumber: '',
        serviceBank: '',
        bankName: '',
        nationalId: '',
        introduction: '',
        portfolioLink: '',
        avatar: '',
        homepageBackground: ''
      }
    }
  },
  created() {
    this.fetchUserInfo()
  },
  methods: {
    async fetchUserInfo() {
      try {
        const response = await getCurrentUser()
        this.user = response.data
      } catch (error) {
        console.error('Failed to obtain user information', error)
        this.$message.error('Failed to obtain user information')
      }
    },
    async updateUserInfo() {
      try {
        await updateUser(this.user)
        // After successfully updating user information, update the user information in localStorage
        localStorage.setItem('currentUser', JSON.stringify(this.user))
        this.$message.success('User information updated successfully')
        // Browser refresh page
        location.reload()
      } catch (error) {
        console.error('Failed to update user information', error)
        this.$message.error('Failed to update user information')
      }
    },
    handleAvatarSuccess(res) {
      this.user.avatar = res.fileDownloadUri
    },
    handleBackgroundSuccess(res) {
      this.user.homepageBackground = res.fileDownloadUri
    },
    beforeImageUpload(file) {
      const isLt9M = file.size / 1024 / 1024 < 9
      if (!isLt9M) {
        this.$message.error('The size of the uploaded image cannot exceed 9MB!')
      }
      return isLt9M
    }
  }
}
</script>

<style scoped>
.user-profile {
  max-width: 800px;
  margin: 0 auto;
}

.background-image {
  position: relative;
  height: 200px;
  overflow: hidden;
}

.background-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.background-uploader {
  position: absolute;
  bottom: 10px;
  right: 10px;
}

.user-info {
  padding: 20px;
}

.avatar-container {
  text-align: center;
  margin-bottom: 20px;
}

.avatar-uploader {
  margin-top: 10px;
}

.user-form {
  max-width: 500px;
  margin: 0 auto;
}
</style>
