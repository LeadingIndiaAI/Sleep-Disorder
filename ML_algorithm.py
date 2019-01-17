#Creator
#@psifrous  - github
#namanbanal9909@gmail.com - e-mail



Required Python Packages
import pandas as pd
import numpy as np
import pdb
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn import metrics


# Files
DATA_SET_PATH = "C:/Users/Beautisaurus/output.csv"


def dataset_headers(dataset):
    """
    To get the dataset header names
    :param dataset: loaded dataset into pandas DataFrame
    :return: list of header names
    """
    return list(dataset.columns.values)


def unique_observations(dataset, header, method=1):
    """
    To get unique observations in the loaded pandas DataFrame column
    :param dataset:
    :param header:
    :param method: Method to perform the unique (default method=1 for pandas and method=0 for numpy )
    :return:
    """
    try:
        if method == 0:
            # With Numpy
            observations = np.unique(dataset[[header]])
        elif method == 1:
            # With Pandas
            observations = pd.unique(dataset[header].values.ravel())
        else:
            observations = None
            print ("Wrong method type, Use 1 for pandas and 0 for numpy")
    except Exception as e:
        observations = None
        print( "Error: {error_msg} /n Please check the inputs once..!".format(error_msg=e.message))
    return observations


def train_logistic_regression(train_x, train_y):
    """
    Training logistic regression model with train dataset features(train_x) and target(train_y)
    :param train_x:
    :param train_y:
    :return:
    """

    logistic_regression_model = LogisticRegression()
    logistic_regression_model.fit(train_x, train_y)
    return logistic_regression_model


def model_accuracy(trained_model, features, targets):
    """
    Get the accuracy score of the model
    :param trained_model:
    :param features:
    :param targets:
    :return:
    """
    accuracy_score = trained_model.score(features, targets)
    return accuracy_score


def main():
    """
    Logistic Regression classifier main
    :return:
    """
    # Load the data set for training and testing the logistic regression classifier
    dataset = pd.read_csv(DATA_SET_PATH)
    print ("Number of Observations :: ", len(dataset))

    # Get the first observation
    print (dataset.head())

    headers = dataset_headers(dataset)
    print ("Data set headers :: {headers}".format(headers=headers))

    training_features = ['High Beta', 'High Alpha', 'High Theta', 'High Delta', 'Lo Delta', 'Lo Alpha', 'Lo Theta', 'Lo Delta.1', 'Mean Beta', 'Mean Alpha', 'Mean Theta', 'Mean Delta', 'SD Beta', 'SD Alpha', 'SD Theta', 'SD Delta', 'Var Beta', 'Var Alpha', 'Var Theta', 'Var Delta']
    target = 'PersonType'

    # Train , Test data split
    train_x, test_x, train_y, test_y = train_test_split(dataset[training_features], dataset[target], train_size=0.7)
    print ("train_x size :: ", train_x.shape)
    print ("train_y size :: ", train_y.shape)

    print ("test_x size :: ", test_x.shape)
    print ("test_y size :: ", test_y.shape)

    print ("edu_target_frequencies :: ", feature_target_frequency_relation(dataset, [training_features[7], target]))

    # Training Logistic regression model
    trained_logistic_regression_model = train_logistic_regression(train_x, train_y)
    
    train_accuracy = model_accuracy(trained_logistic_regression_model, train_x, train_y)

    # Testing the logistic regression model
    test_accuracy = model_accuracy(trained_logistic_regression_model, test_x, test_y)

    print ("Train Accuracy :: ", train_accuracy)
    print ("Test Accuracy :: ", test_accuracy)

if __name__ == "__main__":
    main()
