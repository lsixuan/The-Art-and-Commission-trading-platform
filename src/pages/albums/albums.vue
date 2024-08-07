<template>
  <div>
    <Header/>
    <main>
      <div class="albums-management">
        <el-card>
          <div slot="header">
            <span>albums management</span>
          </div>
          <h1>albums management</h1>
          <!-- Search box and add button -->
          <div class="search-bar">
            <el-input
                v-model="searchKeyword"
                placeholder="Search for artwork..."
                style="width: 200px; margin-right: 10px;"
            ></el-input>
            <el-button type="primary" @click="handleSearch">Search</el-button>
            <el-button type="primary" @click="openAddModal">Add artwork</el-button>
          </div>

          <!-- Artwork Display -->
          <el-row v-if="albums.length > 0" :gutter="20">
            <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="album in albums" :key="album.id"
                    style="margin-bottom: 20px;">
              <el-card :body-style="{ padding: '0px' }">
                <div class="image-container">
                  <img :src="album.cover" class="image" style="width: 100%; height: 200px; object-fit: cover;">
                  <div class="image-count">{{ album.count }}</div>
                </div>
                <div style="padding: 14px;">
                  <span>{{ album.title }}</span>
                  <div class="bottom clearfix">
                    <span>{{ album.count }} picture</span>

                    <el-button type="text" class="button" @click="openEditModal(album)">Edit</el-button>

                    <el-button type="text" class="button" @click="deleteAlbum(album.id)">Delete</el-button>
                    <el-button type="text" class="button" @click="openDetailModal(album)">Manage artworks</el-button>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>

          <!-- Display when there is no data available -->
          <el-empty v-else description="No Artwork data available at the moment">
            <el-button type="primary" @click="openAddModal">Add artwork</el-button>
          </el-empty>

          <!-- paging -->
          <el-pagination
              v-if="total > 0"
              @current-change="handleCurrentChange"
              :current-page.sync="currentPage"
              :page-size="pageSize"
              :total="total"
              layout="prev, pager, next, total"
              style="margin-top: 20px; text-align: center;"
          ></el-pagination>

          <!-- Add/Edit Modal Box -->
          <el-dialog :title="isEditing ? 'Edit artwork' : 'Add artwork'" :visible.sync="showModal">
            <el-form :model="currentAlbum" label-width="80px">
              <el-form-item label="Name of artwork">
                <el-input v-model="currentAlbum.title"></el-input>
              </el-form-item>
              <el-form-item label="cover image">
                <el-upload class="avatar-uploader" action="http://localhost:8080/springbootiymihuashi//api/files/upload/"
                           :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
                  <img v-if="currentAlbumCover" :src="currentAlbumCover" class="avatar">
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
              <!-- Other required fields can be added -->
            </el-form>
            <span slot="footer" class="dialog-footer">
              <el-button @click="closeModal">Cancel</el-button>
              <el-button type="primary" @click="saveAlbum">Determine</el-button>
            </span>
          </el-dialog>
        </el-card>
      </div>
    </main>
  </div>
</template>

<script>
import {getAlbumsPage, createAlbum, updateAlbum, deleteAlbums} from '@/api/albums'
import Header from "@/pages/Header/Header.vue";

export default {
  components: {Header},
  data() {
    return {
      albums: [],
      currentPage: 1,
      pageSize: 12,
      total: 0,
      searchKeyword: '',
      showModal: false,
      isEditing: false,
      currentAlbum: {
        title: '',
        cover: ''
      },
      currentAlbumCover:'',
    }
  },
  methods: {
    handleAvatarSuccess(res, file) {

      this.currentAlbumCover = res.fileDownloadUri;
    },
    beforeAvatarUpload(file) {

      const isLt2M = file.size / 1024 / 1024 < 9;


      if (!isLt2M) {
        this.$message.error('The size of the uploaded avatar image cannot exceed 9MB!');
      }

      return isLt2M;
    },
    async fetchAlbums() {
      try {
        const response = await getAlbumsPage({
          current: this.currentPage,
          size: this.pageSize,
          keyword: this.searchKeyword
        })
        this.albums = response.data.records
        this.total = response.data.total
      } catch (error) {
        this.$message.error('Failed to retrieve the list of artworks')
        console.error('Failed to retrieve the list of artworks:', error)
      }
    },
    handleSearch() {
      this.currentPage = 1
      this.fetchAlbums()
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.fetchAlbums()
    },
    openAddModal() {
      this.isEditing = false
      this.currentAlbum = {}
      this.currentAlbumCover = ''
      this.showModal = true
    },
    openEditModal(album) {
      this.isEditing = true
      this.currentAlbum = {...album}
      this.currentAlbumCover = album.cover
      this.showModal = true
    },
    // Details page
    openDetailModal(album) {

      this.$router.push({path: '/albumInfo', query: {albumId: album.id}})
    },
    closeModal() {
      this.showModal = false
      this.currentAlbum = {}
    },
    async saveAlbum() {
      try {
        this.currentAlbum.cover = this.currentAlbumCover
        if (this.isEditing) {
          await updateAlbum(this.currentAlbum)
          this.$message.success('Artwork updated successfully')
        } else {
          await createAlbum(this.currentAlbum)
          this.$message.success('Artwork added successfully')
        }
        this.closeModal()
        this.fetchAlbums()
      } catch (error) {
        this.$message.error('Failed to save artwork')
        console.error('Failed to save artwork:', error)
      }
    },
    async deleteAlbum(id) {
      try {
        await this.$confirm('Are you sure you want to delete this artwork?', 'Tips', {
          confirmButtonText: 'Determine',
          cancelButtonText: 'Cancel',
          type: 'warning'
        })
        await deleteAlbums([id])
        this.$message.success('Delete successfully')
        this.fetchAlbums()
      } catch (error) {
        if (error !== 'cancel') {
          this.$message.error('Failed to delete artwork')
          console.error('Failed to delete artwork:', error)
        }
      }
    }
  },
  mounted() {
    this.fetchAlbums()
  }
}
</script>



<style scoped>

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
.albums-management {
  padding: 20px;
}

.search-bar {
  margin-bottom: 20px;
}

.el-card {
  transition: all 0.3s;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image-container {
  position: relative;
}

.image {
  width: 100%;
  display: block;
}

.image-count {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
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

