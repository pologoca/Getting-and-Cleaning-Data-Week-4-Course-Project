---
title: "Course project CodeBook"
author: "Leopoldo Gomez Caudillo"
date: "1/3/2021"
output: html_document
---
The "tidyDataSet.txt" file contains 180 rows (30 subjects recorded in 6 activities) and  81 columns (1. subject, 2. activity and 79 measurements), from experiments carried out with 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### The Course project includes the following files:
CODEBOOK.md: Course project and final data details.

README.md: Instructions to download the files and obtain the tidy data.

run_analysis.R: sript to obtain the tidy data.

tidyDataSet.txt: the tidy data file.

#### Variables in the data set

1. Subject: numeric with values beetwen 1 to 30.

2. Activity: factor with 6 activities:
WALKING, 
WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, 
SITTING, 
STANDING and 
LAYING

Only the variables with "mean" and "std" string in their name were kept (79 measurements). The 79 measurements were averaged by subject and activity.

The 79 measurements (variables 3-81) are numeric:

3. tBodyAcc-mean()-X

4. tBodyAcc-mean()-Y

5. tBodyAcc-mean()-Z

6. tBodyAcc-std()-X

7. tBodyAcc-std()-Y

8. tBodyAcc-std()-Z

9. tGravityAcc-mean()-X

10. tGravityAcc-mean()-Y

11. tGravityAcc-mean()-Z

12. tGravityAcc-std()-X

13. tGravityAcc-std()-Y

14. tGravityAcc-std()-Z

15. tBodyAccJerk-mean()-X

16. tBodyAccJerk-mean()-Y

17. tBodyAccJerk-mean()-Z

18. tBodyAccJerk-std()-X

19. tBodyAccJerk-std()-Y

20. tBodyAccJerk-std()-Z

21. tBodyGyro-mean()-X

22. tBodyGyro-mean()-Y

23. tBodyGyro-mean()-Z

24. tBodyGyro-std()-X

25. tBodyGyro-std()-Y

26. tBodyGyro-std()-Z

27. tBodyGyroJerk-mean()-X

28. tBodyGyroJerk-mean()-Y

29. tBodyGyroJerk-mean()-Z

30. tBodyGyroJerk-std()-X

31. tBodyGyroJerk-std()-Y

32. tBodyGyroJerk-std()-Z

33. tBodyAccMag-mean()

34. tBodyAccMag-std()

35. tGravityAccMag-mean()

36. tGravityAccMag-std()

37. tBodyAccJerkMag-mean()

38. tBodyAccJerkMag-std()

39. tBodyGyroMag-mean()

40. tBodyGyroMag-std()

41. tBodyGyroJerkMag-mean()

42. tBodyGyroJerkMag-std()

43. fBodyAcc-mean()-X

44. fBodyAcc-mean()-Y

45. fBodyAcc-mean()-Z

46. fBodyAcc-std()-X

47. fBodyAcc-std()-Y

48. fBodyAcc-std()-Z

49. fBodyAcc-meanFreq()-X

50. fBodyAcc-meanFreq()-Y

51. fBodyAcc-meanFreq()-Z

52. fBodyAccJerk-mean()-X

53. fBodyAccJerk-mean()-Y

54. fBodyAccJerk-mean()-Z

55. fBodyAccJerk-std()-X

56. fBodyAccJerk-std()-Y

57. fBodyAccJerk-std()-Z

58. fBodyAccJerk-meanFreq()-X

59. fBodyAccJerk-meanFreq()-Y

60. fBodyAccJerk-meanFreq()-Z

61. fBodyGyro-mean()-X

62. fBodyGyro-mean()-Y

63. fBodyGyro-mean()-Z

64. fBodyGyro-std()-X

65. fBodyGyro-std()-Y

66. fBodyGyro-std()-Z

67. fBodyGyro-meanFreq()-X

68. fBodyGyro-meanFreq()-Y

69. fBodyGyro-meanFreq()-Z

70. fBodyAccMag-mean()

71. fBodyAccMag-std()

72. fBodyAccMag-meanFreq()

73. fBodyBodyAccJerkMag-mean()

74. fBodyBodyAccJerkMag-std()

75. fBodyBodyAccJerkMag-meanFreq()

76. fBodyBodyGyroMag-mean()

77. fBodyBodyGyroMag-std()

78. fBodyBodyGyroMag-meanFreq()

79. fBodyBodyGyroJerkMag-mean()

80. fBodyBodyGyroJerkMag-std()
81. fBodyBodyGyroJerkMag-meanFreq()