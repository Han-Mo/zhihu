<template>
    <div>
        <button
                class="btn is-naked delete-button"
                @click="showCommentsForm"
                v-text="text"
        ></button>
        <div class="modal fade" :id="dialog" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            评论列表
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>


                    </div>

                    <div class="modal-body">


                        <!--<div class="alert alert-success" v-if="comments.length > 0">
                            <div class="media" v-if="">
                                <div class="media"
                            </div>
                        </div>-->
                        <div v-if="comments.length > 0">
                            <div class="media" v-for="comment in comments">
                                <img :src="comment.user.avatar" width='24' class="mr-3" alt="">
                                <div class="media-body">
                                    <h5 class="mt-0">{{comment.user.name}}</h5>
                                    {{ comment.body }}
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Modal Actions -->
                    <div class="modal-footer">
                        <input type="text" class="form-control" v-model="body" >

                        <button type="button" class="btn btn-primary" @click="store">评论
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props:['type','model','count'],

        data(){
            return {
                body:'',
                comments:[],
                /*newComment:{
                    user:{
                        name:Zhihu.name,
                        avatar:Zhihu.avatar
                    },
                    body:''
                }*/
            }
        },
        computed:{
            dialog() {
                return 'comments-dialog-' + this.type + '-' + this.model;
            },
            dialogId() {
                return '#' + this.dialog
            },
            text() {
                return this.count + '评论'
            }
        },
        methods:{
            store(){
                axios.post('/api/comment',{'type':this.type,'model':this.model,'body':this.body}).then(response => {
                    /*this.newComment.body = response.data.body;*/

                    let comment = {
                        user:{
                            name:Zhihu.name,
                            avatar:Zhihu.avatar
                        },
                        body:response.data.body
                    };
                    this.comments.push(comment);
                    this.body = '';
                    this.count++
                })
            },
            showCommentsForm(){
                this.getComments();
                $(this.dialogId).modal('show');
            },
            getComments() {
                axios.get('/api/'+ this.type + '/' + this.model + '/comments').then(response => {
                    this.comments = response.data;
                })
            },

        }
    }
</script>
