# README

This README would normally document whatever steps are necessary to get the
application up and running.

## 1. Installing rails 6 application
* References: https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails (3.1 Installing Rails)

## 2. Running the demo
### Step 1: Get the gmv_cico source from Github repo 
```
git clone https://github.com/trongthaonh/receiper-parser-demo.git
cd receiper-parser-demo
```

### Step 2: Install gems using `bundle` 
```
bundle install
```


### Step 3: Credentials configuration
Securely copy **master.key** and **google vision credentials** json file to **app/config** folder


### Step 4: Setup databases

```
bin/rake db:create
bin/rake db:migrate
```
### Step 5: Running

```
rails s
```
This app starts a server and listens on port 3000 for connections: http://localhost:3000


## 3. Importing the receipts images
### 3.1 Copy receipt images folder to inside the app/public folder
```
cp receipt_parser_images app/public/receipt_parser_images
```

### 3.2 Importing images to the database
```
bin/rake import_receipt
```

### 3.3 Detect text in receipt images
```
bin/rake detect_receipt
```

### 3.4 Check the results
Go to http://localhost:3000/receipts

## REFERENCE DOCUMENTATION
- Detect text in images: https://cloud.google.com/vision/docs/ocr
- Google cloud vision client for PHP and Setting up authentication: https://cloud.google.com/vision/docs/libraries#client-libraries-install-php
- Online regular expression tester: https://regex101.com/

## REFERENCE SOURCE CODE
Our main service class locate at app/services/google_vision_service.rb

## CONTACT
If you have any questions about setting up rails application / google vision or regular expression, don't hesitate to contact us via Slack
- Van Tran
- Trong Thao

### Happy coding!
