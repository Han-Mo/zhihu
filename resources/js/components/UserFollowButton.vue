<template>
    <button
            class="btn"
            v-bind:class="{'btn-success':followed}"
            v-text="text"
            v-on:click="follow"
    >
    </button>

</template>

<script>
    export default {
        props:['user'],
        mounted() {
            axios.get('/api/user/followers/'+this.user).then(response => {
                this.followed = response.data.followed
            })
        },
        data(){
            return {
                followed:false
            }
        },
        computed: {
            text() {
                return this.followed ? '已关注' : '关注他'
            }
        },
        methods:{
            follow(){
                axios.post('/api/user/follow',{'user':this.user,}).then(response => {
                    this.followed = response.data.followed
                })
            }
        }
    }
</script>
