<template>
    <div class="feed">
        <ul v-if="contact">
            <li v-for="message in messages" class="message${message.to == contact.id ? 'sent':'receive'}" :key="message.id">
                <div class="text">
                    {{message.text}}
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    props:{
        contact:{
            type: Object
        },
        messages:{
            type: Array,
            required: true
        }
    }
}
</script>
<style lang="scss" scoped>
.feed{
    background: #f0f0f0;
    height: 100%;
    max-height: 570px;
    overflow: scroll;
    ul{
        list-style-type: none;
        padding: 5px;
        li{
            .message{
                margin: 10px 0;
                width: 100%;
                
                .text{
                    max-width: 200px;
                    border-radius: 5px;
                    padding: 5px;
                    display: inline-block;
                }
                .receive{
                    text-align: right;
                    .text{
                        background: #b2b2b2;
                    }
                  
                    }  .sent{
                        text-align: right;
                        .text{
                            background: #b2b2b2;
                        }
                }
            }
        }
    }
}
</style>