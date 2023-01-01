#!/bin/bash
pipeline{
	agent any
	environment{
		git_url = 'https://github.com/adam-number-1/Data_entry_tool.git'
		
	}
	stages{
		stage("GitHub Checkout and setup"){
		    steps{
    			echo 'Cloning repository'
    			git branch: 'master', url:'https://github.com/adam-number-1/Data_entry_tool.git'
    			//git "$git_url"
    			sh 'ls -la'
    
    			echo 'changing python version to 3.11.0'
    			sh '''#!/bin/bash
                      . ~/.bashrc
                      pyenv versions
                      pyenv global 3.11.0
                      pyenv versions
                      python3 -V
    			      echo "Creating virtual environment and installing dependencies"
    			      python3 -m venv test_venv
        			  test_venv/bin/activate
    			      pip install -r requirements.txt
                '''

    			//sh '. ~/.profile'

    				

		    }
		}
		stage("Test"){
		    steps{
    			echo 'Starting Pytest'
   			    sh '''#!/bin/bash
                      . ~/.bashrc
                      python3 -m pytest --junitxml=./junitreport/output.xml tests/test_gui.py::TestObjectTable::test_delete_row
                '''
		    }
		}
	}
	post{
		always{
			echo 'publishing JUnit test report'
			junit skipMarkingBuildUnstable: true, testResults: 'junitreport/output.xml'
		}
	}
			
	
}