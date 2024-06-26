<template>
    <div>
        <Header style="margin-bottom: 140px;" :defaultActive="defaultActive" />
        <router-view></router-view>
    </div>
</template>

<script>
import Header from '@/pages/Header/Header.vue'
export default {
    name: 'Home',
    components: { Header },
    data() {
        return {
            defaultActive: '1'
        }
    }
}
</script>

<style></style>