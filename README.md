# devsecops-example-prod

A DevSecOps terraform prod VPC example

This project implements a basic DevSecOps infrastructure. This deployment uses modules found in [DevSecOps](https://github.com/GSA/DevSecOps). This repo can be used against your own environment by setting the variables the way you want them, with the other variables left to the defaults.

## Products In Use

* [`terraform/`](terraform/) - [Terraform](https://www.terraform.io/) code for setting up the infrastructure at the [Amazon Web Services (AWS)](https://aws.amazon.com/) level

## Important concepts

### Configuration as code

All configuration is code, and [all setup steps are documented](#setup). New environment(s) can be created from scratch quickly and reliably.

### DRY

The code follows the [Don’t Repeat Yourself (DRY)](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principle. Values that need to be shared are passed around as variables, rather than being hard-coded in multiple places. This ensures configuration stays in sync.

## Setup

If you’ve already deployed the DevSecOps-Infrastructure repo, chances are you’ve already done some of this.

1. Set up the AWS CLI on the workstation that will be used to deploy the code.
    1. [Install](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
    1. [Configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
1. Install additional dependencies:
    * [Terraform](https://www.terraform.io/)

1. Set up the Terraform backend for this deployment. Note that this is a different backend from others. We’ll refer to the remote state backend later. You will need to replace your bucket name with something unique, because bucket names must be unique per-region. If you get an error that the bucket name is not available, then your choice was not unique. Remember this bucket name, you’ll need it later.

    ```sh
    aws s3api create-bucket —bucket <your_unique_bucket_name>
    aws s3api put-bucket-versioning —<your_unique_bucket_name> —versioning-configuration Status=Enabled
    ```

1. Create the Terraform variables file.

    ```sh
    cd terraform
    cp terraform.tfvars.example terraform.tfvars
    cp backends.tfvars.example backends.tfvars
    ```

1. Fill out [`terraform.tfvars`](terraform/terraform.tfvars.example). Mind the variable types and follow the noted rules. Defaults are provided in [`vars.tfvars`](Terraform/vars.tfvars) if you need examples or want to see where values are coming from.

1. Fill out [‘backends.tfvars’](terraform/backends.tfvars.example). The “bucket” parameter *must* match the bucket name you used in the AWS CLI command above, otherwise terraform will throw an error on the init command.

That's it! You can now deploy.

You may want to fork this repo and use it to create your own copy of this environment with EC2 resources or whatnot. If you wish to add them, feel free to fork this repo and add them on your own.

## Deployment

1. Make sure your AWS CLI is set up and configured with the proper credentials.

1. For initial deployment, change directory in the /terraform directory.

    ````sh
    cd terraform
    ````

1. Run terraform init:

    ````sh
    terraform init --backend-config="backend.tfvars"
    ````

1. Run a terraform plan, just to make sure all is well:

    ````sh
    terraform plan
    ````

1. If everything comes back green and ready, then just run a terraform apply:

    ````sh
    terraform apply
    ````

1. Operate and maintain the environment. If you ever need to tear the whole thing down, just run terraform destroy from the /terraform directory:

    ````sh
    terraform destroy
    ````
