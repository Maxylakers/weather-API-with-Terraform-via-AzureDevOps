- This is a procedure to build and deploy a weather API application written in .NET Core 3.1 to Azure infrastructure using Azure DevOps pipelines and Terraform.

- First, we generate the ASP.NET Core Web API webapi template which is seen via the command in CMD: dotnet new.

- Next, to create the project, we use: dotnet new webapi -n weatherapi
 This essentially creates the project which we then open in VS code using: code -r weatherapi

- Start the app with: dotnet run weatherapi, and open the app in a browser via: localhost:5000/weatherforecast

- Next, create a Dockerfile to expose ports 80

- Build the project into a Docker image using: docker build -t scorpionrevolver/weatherapi

- Once completed, push the image to Docker Hub using: docker push scorpionrevolver/weatherapi

- Set up Azure DevOps environment and add Service Connections to both Docker Hub and Azure Resource Manager

- Create an Azure Pipeline and use GitHub and code source

- Select Docker to get the auto generated YAML file

- Generate and replace the last task to include a build and push command with details of the container registry and container repository.

- Save and run the script to run the pipeline build and push the build to Docker Hub.