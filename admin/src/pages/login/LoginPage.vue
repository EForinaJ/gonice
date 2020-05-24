<template>
  <div class="main">
    <a-form
      id="formLogin"
      class="user-layout-login"
      ref="formLogin"
      :form="form"
      @submit="handleSubmit"
    >
    <a-alert v-if="state.isLoginError" :message="state.isLoginMag" type="error" showIcon style="margin-bottom: 24px;" />
      <!-- 用户名和密码 -->
      <a-form-item>
        <a-input
          size="large"
          type="text"
          placeholder="用户名"
          v-decorator="[
            'username',
            { initialValue: 'admin',rules: [{ required: true, message: '请输入帐户名或邮箱地址' }], validateTrigger: 'change'}]"
        >
          <a-icon slot="prefix" type="user" :style="{ color: 'rgba(0,0,0,.25)' }"/>
        </a-input>
      </a-form-item>
      <a-form-item>
        <a-input
          size="large"
          type="password"
          autocomplete="false"
          placeholder="密码: admin or ant.design"
          v-decorator="[
            'password',
            {initialValue: '123456',rules: [{ required: true, message: '请输入密码' }], validateTrigger: 'blur'}
          ]"
        >
          <a-icon slot="prefix" type="lock" :style="{ color: 'rgba(0,0,0,.25)' }"/>
        </a-input>
      </a-form-item>
      <!-- 验证码 -->
      <a-row>
        <a-col :span="14">
          <a-form-item>
            <a-input
              size="large"
              type="text"
              placeholder="验证码"
              v-decorator="[
                'code',
                {rules: [{ required: true, message: '请输入验证码' }], validateTrigger: 'change'}]"
            >
            </a-input>
          </a-form-item>
        </a-col>
        <a-col :span="9" :offset="1">
          <img @click="captcha" :src="captchaImg" alt="验证码" class="captcha">
        </a-col>
      </a-row>

      <!-- 记住密码 -->

      <a-form-item>
        <a-checkbox v-decorator="['rememberMe']">自动登录</a-checkbox>
        <router-link
          :to="{ name: 'recover', params: { user: 'aaa'} }"
          class="forge-password"
          style="float: right;"
        >忘记密码</router-link>
      </a-form-item>

      <a-form-item style="margin-top:24px">
        <a-button
          size="large"
          type="primary"
          htmlType="submit"
          class="login-button"
          :loading="state.loginBtn"
          :disabled="state.loginBtn"
        >确定</a-button>
      </a-form-item>

      <!-- 第三方登录 -->
      <div class="user-login-other">
        <span>其他登录方式</span>
        <a>
          <a-icon class="item-icon" type="alipay-circle"></a-icon>
        </a>
        <a>
          <a-icon class="item-icon" type="taobao-circle"></a-icon>
        </a>
        <a>
          <a-icon class="item-icon" type="weibo-circle"></a-icon>
        </a>
        <router-link class="register" :to="{ name: 'register' }">注册账户</router-link>
      </div>
    </a-form>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { timeFix } from '@/utils/util'

export default {
  data () {
    return {

      form: this.$form.createForm(this),
      state: {
        loginBtn: false,
        isLoginError:false,
        isLoginMag:null,
      },
      // 验证码信息
      captchaImg:null,
      captchaKey:null
    }
  },
  created () {
    this.captcha()
  },
  methods: {
    ...mapActions(['Login', 'getCaptcha']),

    handleSubmit(e){
      e.preventDefault()
      this.state.loginBtn = true
      this.form.validateFields(async (err, values) => {
        if (!err) {
          try {
            const loginParams = { ...values }
            loginParams.key = this.captchaKey
            const msg = await this.Login(loginParams)
            this.$router.push({ path: '/' })
            setTimeout(() => {
              this.$notification.success({
                message: '欢迎',
                description: `${timeFix()}，欢迎回来`
              })
            }, 1000)
            this.isLoginError = false
          } catch (error) {
            setTimeout(() => {
              this.state.isLoginError = true
              this.state.isLoginMag = error
              this.captcha()
              this.state.loginBtn = false
            }, 600)
          }
        } else {
          setTimeout(() => {
            this.state.loginBtn = false
          }, 600)
        }
      })
    },
    // 获取验证码
    async captcha () {
      const data = await this.getCaptcha()
      if (data.code != 1) {
        this.$notification['error']({
          message: '错误',
          description: data.message,
          duration: 4
        })
      }
      this.captchaImg = data.data.B64
      this.captchaKey = data.data.Id
    }
  }
}
</script>

<style lang="less" scoped>
.user-layout-login {
  label {
    font-size: 14px;
  }

  .getCaptcha {
    display: block;
    width: 100%;
    height: 40px;
  }

  .forge-password {
    font-size: 14px;
  }

  button.login-button {
    padding: 0 15px;
    font-size: 16px;
    height: 40px;
    width: 100%;
  }

  .user-login-other {
    text-align: left;
    margin-top: 24px;
    line-height: 22px;

    .item-icon {
      font-size: 24px;
      color: rgba(0, 0, 0, 0.2);
      margin-left: 16px;
      vertical-align: middle;
      cursor: pointer;
      transition: color 0.3s;

      &:hover {
        color: #1890ff;
      }
    }

    .register {
      float: right;
    }
  }
}
.captcha{
  width: 100%;
}
</style>
