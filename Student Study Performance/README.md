# Student Performance Analysis Project

## Introduction
This project aims to analyze the factors influencing student performance, particularly focusing on variables such as gender, ethnicity, parental level of education, lunch type, and completion of a test preparation course. Understanding how these factors correlate with academic achievement can provide insights for educators, policymakers, and researchers to improve educational outcomes.

## Overview of the Dataset
The [dataset](https://www.kaggle.com/datasets/bhavikjikadara/student-study-performance) used in this project contains information on the academic performance of students in various subjects, including math, reading, and writing. Additionally, it includes demographic variables such as gender, ethnicity, parental level of education, lunch type, and whether the student completed a test preparation course.

### Dataset Columns:
- `gender`: Sex of the student (Male/Female)
- `race_ethnicity`: Ethnicity of the student (Group A, B, C, D, E)
- `parental_level_of_education`: Highest level of education attained by the student's parents
- `lunch`: Type of lunch received by the student (Standard or Free/Reduced)
- `test_preparation_course`: Whether the student completed a test preparation course (Complete/None)
- `math_score`: Score obtained in the math subject
- `reading_score`: Score obtained in the reading subject
- `writing_score`: Score obtained in the writing subject

## Steps and Findings

### Step 1: Data Exploration and Preparation
- Loaded the dataset into R using the `read.csv()` function.
- Explored the structure, summary statistics, missing values, and duplicates in the dataset and removing outliers.
  
### Step 2: Exploratory Data Analysis (EDA)
- Conducted univariate analysis to explore the distributions of individual variables.
- Performed bivariate analysis to analyze relationships between variables.
- Investigated correlations between numerical variables.
- Compared distributions across different groups (e.g., gender, ethnicity) using visualizations.

### Step 3: Gender Analysis
- Analyzed the performance differences between male and female students.
- Identified significant differences in performance across different subjects.
- Concluded that male students excel in math, while female students excel in reading and writing.

### Step 4: Ethnicity Analysis
- Examined performance differences among students from different ethnic groups in each subject.
- Concluded that there are significant differences in performance across ethnic groups.
- Found that students from group E tend to perform the best, while those from group A perform the worst.

### Step 5: Parental Level of Education Analysis
- Investigated the influence of parental level of education on student performance.
- Concluded that parental level of education significantly impacts academic performance across all subjects.
- Found that students with higher-educated parents tend to perform better academically.

### Step 6: Lunch Analysis
- Explored the impact of lunch type on student performance.
- Found significant differences in performance between students with standard lunch and those with free/reduced lunch across all subjects.
- Concluded that students with standard lunch tend to outperform their peers with free/reduced lunch.

### Step 7: Test Preparation Course Analysis
- Analyzed the effect of completing a test preparation course on student performance.
- Found significant differences in performance between students who completed the course and those who did not across all subjects.
- Concluded that completing the test preparation course is associated with higher exam scores.

## Conclusion
The analysis of student performance in this project revealed significant insights into the factors influencing academic achievement. Gender, ethnicity, parental level of education, lunch type, and completion of a test preparation course were all found to impact student performance across math, reading, and writing subjects. Understanding these factors can inform strategies to support students and improve educational outcomes.
