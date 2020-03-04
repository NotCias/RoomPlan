Group Project - README Template
===

# Chores App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An application that allows users to create groups with others, and create/assign tasks to certain users. Tasks can also be randomly assigned to a user, and can rotate through the group. Tasks can be repeated weekly, monthly, or yearly. Users can optionally create tasks for themselves and not join a group.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity
- **Mobile:** The app would first be produced for mobile devices, but there is no reason it wouldn't sync across all devices. It would be more simple to use on mobile devices.
- **Story:** Assigns users to perform certain tasks, and keeps track of which tasks have been completed or not. A report summarizing the status of all tasks within a group is provided to all members of the group by the end of the week.
- **Market:** This app could be used for many different purposes regarding teamwork. The primary demographic would be college students looking for an app to keep a list of chores to do in their apartments.
- **Habit:** This app would be used at the least weekly, to check what tasks need to be done for the person and what everyone else must do.
- **Scope:** We would begin with connecting users and allowing them to create tasks. We would potentially evolve into integrating these tasks within the Calendar app and allowing people on all devices to join a group.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in and can see which groups they are a part of
* User can join new groups
* User can create a new task
* User can view different tasks they are expected to do

**Optional Nice-to-have Stories**

* Custom options for tasks: Repeats, time alerts, notifications
* Integrate tasks with the native iOS calendar app
* Users can see other users within a joined group and what tasks they have been assigned

### 2. Screen Archetypes

* Login
* Register - User signs up or logs into an account
   * Upon entry to the app, the user will see fields to type in a username and password. Users can choose to sign up if they have not already, or sign in if they have already created an account.
* Dashboard - List of Tasks to complete
   * Upon successful login or registration, users will see a list of tasks they have been assigned to do from all of the groups they are a member of.
* Create Task
   * Users can select the + button at the top right of the screen to create a new task for themselves or their group.
* Join a Group
   * Upon selection of the join button, users can input a special name and code to join a group.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dashboard
* Join a Group

**Flow Navigation** (Screen to Screen)

* Log In -> Account Creation
* Join a Group -> Search for name and enter password (if necessary)
* Create Task -> Provide description of task

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
