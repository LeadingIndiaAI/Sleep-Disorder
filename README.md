# Sleep_Disorder_Detection

1.Clean your dataset using the scripts
2.Input your EEG cleaned data into Preprocessing.m 
3.Define annotations in output.csv
4.Use the output file in MLalgorithm.py


This gives an abstract of how to detect sleep disorder (insomnia here) using ML.

In the first part we took the dataset of normal persons recording and insomnia persons recording from the Physionet website.

Then the project is divided into 4 main steps. That is signal preprocessing, feature extraction, training the data and testing the data.

In signal preprocessing the EEG signal is filtered from all the noises and the signal is classified by frequency analysis.

Using methods like discrete Fourier transformation we changed the time domain into frequency domain and then obtained the alpha beta theta, delta waves.

We took the cutoff frequency as 0.5 and 30 as all these waves range in that.

The next step was feature extraction. We extracted features like mean, minimum, maximum, standard deviation and variance. These are taken for all the waves so in total we have 20 features and the obtained features were uploaded to a CSV file.

The further process is training the data set we selected the features and using logistic regression we divide the dataset into normal person and insomnia person in a ratio of 70:30.

Then the dataset was trained and the training accuracy came to 100% while the testing accuracy came between 60% to 80

Dataset taken from physionet.org
