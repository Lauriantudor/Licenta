<template>
    <div class="composer">
        <textarea v-model="message" @keydown.enter="send" placeholder="Message..."></textarea>
    </div>
</template>

<script>
    export default{
       data(){
           return{
               message: ''
           }
       },
       methods:{
            send(){
                if(this.message == ''){
                    return;
                }

                this.$emit('send', this.message);
                this.message = '';
            } 
        }
    }
</script>
<style lang="scss" scoped>
textarea {
    width: 96%;
    resize: none;
    margin: 10px;
    border-radius: 3px;
    border: 1px solid black;
    padding: 6px;
}
</style>