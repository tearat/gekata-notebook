import axios from 'axios'
import Cookies from 'js-cookie'

const host = process.env.VUE_APP_API_HOST
const port = process.env.VUE_APP_API_PORT

const email = Cookies.get('email') || 'null'
const token = Cookies.get('token') || 'null'

export default new axios.create({
    baseURL: `http://${host}:${port}/api`,
    headers: {
      'X-User-Email': email,
      'X-User-Token': token,
    }
});
