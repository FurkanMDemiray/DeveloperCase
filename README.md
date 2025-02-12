<div align="center">
  <h1>Developer Case</h1>
</div>
 
Welcome to User List. A simple user list app that shows users.

## Table of Contents
- [Features](#features)
  - [Screenshots](#screenshots)
  - [Tech Stack](#tech-stack)
  - [Architecture](#architecture)
  - [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Users](#users)
  - [Detail](#detail)
- [Known Issues](#known-issues)
- [Improvements](#improvements)

## Features

  **Users:**
- It is a user application where you can look at the name, email, user name etc. of the users.
  
 **Detail:**
- You can look details of users.

## Screenshots

| Image 1 | Image 2 |
|:-------:|:-------:|
| <img src="https://github.com/FurkanMDemiray/DeveloperCase/blob/main/gifs/1.gif" width="250"> | <img src="https://github.com/FurkanMDemiray/DeveloperCase/blob/main/gifs/2.gif" width="250"> |
| Home | Detail | 

## Tech Stack

- **Xcode:** Version 16.2
- **Language:** Swift 6.0.3
- **Minimum iOS Version:** 15.6
- **Dependency Manager:** SPM

## Architecture

![Architecture](https://devnot.com/wp-content/uploads/2015/01/mvvm-pattern.gif)

In developing The Project, MVVM (Model-View-View Model) architecture is used.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Xcode installed

## Usage

###  Listing - Users

1. Open the app on your simulator or device.
2. Browse and select an user.
3. Navigate to user detail by tapping on the relevant user cell.

 <p align="left">
  <img src="https://github.com/FurkanMDemiray/DeveloperCase/blob/main/gifs/1.gif" alt="Listing" width="200" height="400">
</p>

---

## Detail

1. Click to user cell to see the detail of the user.

<p align="left">
  <img src="https://github.com/FurkanMDemiray/DeveloperCase/blob/main/gifs/2.gif" alt="Listing" width="200" height="400">
</p>

---

## Known Issues
- In the main view model unit test, if you run the all test the 'testFetchUsersSuccess' will fail, but if you run only the 'testFetchUsersSuccess' it will pass. 


## Improvements
- More beautiful visuals can be added to the views.
