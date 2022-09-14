
# Jenkins Free Style Project

This snippet is a part of my assignment while I was learning jenkins and the task was to create a freestyle jenkins project to automate the cloudformation stack creation and updation 


## Task Requirements
* Create a cloudformation stack, if not exist.
* Update the cloudformation stack, if the stack exist.
* Make sure to handle all cloudformation validation errors on create and update stack.

## My approch to the problem.
* Create a github repo and push the cloudformation template so, we can use that repo as file source to create and update.
* setup your awscli credentials in (manage jenkins) -> (manage credentials) as global.
* setup your repo as SCM 
* Run the script in the build steps of execute shell or paste the script contents in there.
* Run the build to validate if the job passes or fail. 
