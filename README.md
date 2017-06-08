# Welcome to UIT ES Creator
**UIT ES Creator** is a web-application that can create instantly the exam schedule for **UITers**. This creator helps you save your time. Let's spend your time for going on a date :&#41;.

### Screenshots
![alt text](https://user-images.githubusercontent.com/13912857/26916798-e181be9e-4c55-11e7-8a9e-a5869f5f3d42.png)
![alt text](https://user-images.githubusercontent.com/13912857/26916803-e3163d5c-4c55-11e7-89e1-2fe4f8acb9d2.png)

# How to use
1. Visit  [this link](http://uesc.foxfizz.com/)
2. Enter your Student ID
3. Enjoy!

# API
The HTTP API takes GET requests in the following schema:

``
http://uesc.foxfizz.com/api/v1/daa/uesc.{FORMAT}?student_id={STUDENT_ID}
``

### Examples
**JSON**
``
http://uesc.foxfizz.com/api/v1/daa/uesc.json?student_id=12345678
``

**XML**
``
http://uesc.foxfizz.com/api/v1/daa/uesc.xml?student_id=12345678
``

# Contributing
I encourage you to contribute to **UIT ES Creator**! Please follow the instruction below:

1. Fork it (https://github.com/fongfan999/uit_es_creator/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
