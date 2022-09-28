# Environment Orchestration

The purpose of this project is to demonstrate how you can create an orchestrator for Firebase environments.  

## Structure
### Modules
This is where all Terraform modules exist.
### Admin
The admin project is the project that will orchestrate the different environments.
### Functions
A lot of the orchestration is done via Cloud Functions.  All functions are created inside this folder.
### Environment
The Environment folder is the folder where the template code exists for the Firebase environment.
### Customer environment
A sub-folder is created for each individual environment, incl. Terraform state files.