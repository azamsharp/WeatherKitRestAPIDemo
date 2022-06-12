const express = require('express')
const jwt = require('jsonwebtoken')
const fs = require('fs')
const axios = require('axios')
const app = express() 

const privateKey = fs.readFileSync('AuthKey_T4PB9QSRPG.p8') // Make sure to download the private key 

const token = jwt.sign({
    subject: 'com.azamsharp.WeatherApp'
}, privateKey, {
    jwtid: 'TEAMID.com.azamsharp.WeatherApp', 
    issuer: 'TEAMID', 
    expiresIn: '1hr', 
    keyid: 'KEYID', 
    algorithm: 'ES256',
    header: {
        id: 'TEAMID.com.azamsharp.WeatherApp'
    }
})

// localhost:8080/
app.get('/', async (req, res) => {

    const url = 'https://weatherkit.apple.com/api/v1/weather/en/29.734560/-95.393690?dataSets=currentWeather'

    const configuration = {
        headers: { Authorization: `Bearer ${token}` }
    }

    const result = await axios.get(url, configuration)
    console.log(result)
    res.json(result.data)

})


app.listen(8080, () => {
    console.log('Server is running...')
})