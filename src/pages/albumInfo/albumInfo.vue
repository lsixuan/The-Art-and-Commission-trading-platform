<template>
  <div>
    <Header/>
    <main>
      <div class="album-images">
        <el-button type="primary" @click="handleAdd" class="add-button">Add image</el-button>
        <el-row :gutter="20">
          <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="image in albumImages" :key="image.id" class="image-item">
            <el-card :body-style="{ padding: '0px' }" shadow="hover">
              <div class="image-container">
                <el-image
                    v-if="image.imageSrc"
                    :src="image.imageSrc"
                    fit="cover"
                    :preview-src-list="[image.imageSrc]"
                >
                  <div slot="error" class="image-slot">
                    <i class="el-icon-picture-outline"></i>
                  </div>
                </el-image>
                <!--            <img v-if="image.imageSrc" :src="image.imageSrc" class="image" alt="Album Image">-->
                <div v-else class="no-image">No image</div>
              </div>
              <div class="image-actions">
                <el-button type="text" icon="el-icon-edit" @click="handleEdit(image)">edit</el-button>
                <el-button type="text" icon="el-icon-delete" @click="handleDelete(image.id)">delete</el-button>
              </div>
            </el-card>
          </el-col>
        </el-row>

        <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="30%">
          <el-form :model="form" label-width="80px">
            <el-form-item label="image">
              <el-upload
                  class="avatar-uploader"
                  action="http://localhost:8080/springbootiymihuashi/api/files/upload/"
                  :show-file-list="false"
                  :on-success="handleAvatarSuccess"
                  :before-upload="beforeAvatarUpload">
                <img v-if="form.imageSrc" :src="form.imageSrc" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="submitForm">Determine</el-button>
      </span>
        </el-dialog>
      </div>
    </main>
  </div>
</template>

<script>
import {getAlbumImagesPage, createAlbumImage, updateAlbumImage, deleteAlbumImages} from '@/api/albumImages'
import Header from "@/pages/Header/Header.vue";

export default {
  components: {Header},
  data() {
    return {
      albumImages: [],
      dialogVisible: false,
      dialogTitle: '',
      form: {
        id: null,
        albumId: null,
        imageSrc: '',
        userId: null
      }
    }
  },
  created() {
    this.fetchAlbumImages()
  },
  methods: {
    async fetchAlbumImages() {
      const albumId = this.$route.query.albumId
      const {data} = await getAlbumImagesPage({albumId: albumId})
      this.albumImages = data
    },
    handleAdd() {
      this.dialogTitle = 'Add image'
      this.form = {
        albumId: this.$route.query.albumId,
        imageSrc: '',
      }
      this.dialogVisible = true
    },
    handleEdit(image) {
      this.dialogTitle = 'Edit image'
      this.form = {...image}
      this.dialogVisible = true
    },
    async handleDelete(id) {
      try {
        await this.$confirm('Are you sure you want to delete this image?', 'Tips', {
          confirmButtonText: 'Determine',
          cancelButtonText: 'Cancel',
          type: 'warning'
        })
        await deleteAlbumImages([id])
        this.$message.success('Delete successfully')
        this.fetchAlbumImages()
      } catch (error) {
        console.error(error)
      }
    },
    async submitForm() {
      try {
        if (this.form.id) {
          await updateAlbumImage(this.form)
        } else {
          await createAlbumImage(this.form)
        }
        this.$message.success(this.form.id ? 'Update successful' : 'Added successfully')
        this.dialogVisible = false
        this.fetchAlbumImages()
      } catch (error) {
        console.error(error)
      }
    },
    handleAvatarSuccess(res, file) {
      this.form.imageSrc = res.fileDownloadUri;
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 9;
      if (!isLt2M) {
        this.$message.error('The size of the uploaded image cannot exceed 9MB!');
      }
      return isLt2M;
    }
  }
}
</script>

<style scoped>
.album-images {
  padding: 20px;
}

.add-button {
  margin-bottom: 20px;
}

.image-item {
  margin-bottom: 20px;
}

.image-container {
  height: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.no-image {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-color: #f5f7fa;
  color: #909399;
  font-size: 14px;
}

.image-actions {
  padding: 10px;
  text-align: right;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
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
