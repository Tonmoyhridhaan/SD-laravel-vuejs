# Laravel-VueJS-project-04

## Backend [Laravel]
### Laravel is a MVC(Model View Controller) framework

## Build Setup
> install dependency (composer)
* setup: [composer](https://getcomposer.org)

### cli
``` bash
# one time install only
composer global require laravel/installer  

# initial project creation     
laravel new laravel-project4   

# create/run server #url: http://127.0.0.1:8000/                 
php artisan serve                               
```
---
## Frontend [Vue-JS]
## Build Setup
> install Node Js(v8 engine) | dependency (npm)
* setup: [NOdeJs LTS](https://nodejs.org/en/download/)

### cli
``` bash
# one time install only
npm install -g @vue/cli                        
npm install -g @vue/cli-init                   

# initial project creation
vue init webpack vuejs-project4          

# create/run server  #url: http://localhost:8080/
npm run dev                                     
```

### Bootstrap Integration
``` bash
# individual project integration
npm i bootstrap
```
> Add to : ``` src/main.js ```
``` bash
import 'bootstrap'; 
import 'bootstrap/dist/css/bootstrap.min.css'; 
```

### Api Package configuration [Axios]
``` bash
# individual project integration
npm i axios --save
```
> Add to:  ``` src/main.js ```
``` bash
import axios from 'axios'
Vue.prototype.$http = axios
```
> used to sent POST and GET request to the server

### Database
Export updated database ```project_04``` to Localhost Server

### Bootstrap vue Integration
``` bash
# individual project integration
# With npm
npm install vue bootstrap bootstrap-vue
```
> Add to : ``` src/main.js ```
``` bash


import { BootstrapVue, IconsPlugin } from 'bootstrap-vue' 
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
```

## Software Screenshots

#### Login Page

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.42.53%20PM.png)

<h3 align="center">Admin Panel</h3>

#### Admin dashboard

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.42.02%20PM.png)

#### Admin Manage session

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.45.43%20PM.png)

#### Admin Enrollment Requests

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.47.35%20PM.png)

#### Admin Session Creation

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.50.12%20PM.png)

<h3 align="center">Teacher Panel</h3>

#### Teacher Marks Distribution

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%202.19.47%20PM.png)

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%202.20.01%20PM.png)

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%202.20.18%20PM.png)

#### Teacher Marks Assign

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.43.53%20PM.png)

<h3 align="center">Student Panel</h3>

#### Student Enrollment

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.44.53%20PM.png)

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.44.57%20PM.png)

#### Student Result

![alt text](https://github.com/Tonmoyhridhaan/SD-laravel-vuejs/blob/master/images/Screenshot%202024-02-13%20at%201.45.17%20PM.png)

