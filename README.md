---
title: "Course Project"
author: "Hector Hoyos"
output: html_document
---

### Human Activity Recognition Using Smartphones Dataset

Data Science Specialization
Course: Getting and Cleaning Data
Course Project

date: "Friday, November 21, 2014"

==================================================================

## General Description

This document explains the analysis made on the "Human Activity Recognition Using Smartphones Dataset" [1] 

==================================================================

## Data set description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

==================================================================

## Performed Analysis:

An R script called run_analysis.R was made. This does the following. 
- Upload in R and merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set
- Labels the data set with descriptive variable names and relate the data set with the subjects
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

==================================================================

## Files included in the gitHub repository:

- 'README.md'

- 'run_analysis.R': Include the necessary code in R to perform the analysis

- 'tidy_data.txt': Output file with the analysis performed

- 'Code Book.pdf': description of variables in the 'tidy_data.txt" file

==================================================================

## REFFERENCES

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
