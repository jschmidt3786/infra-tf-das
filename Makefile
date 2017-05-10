.DEFAULT_GOAL := help
.PHONY: help deps plan plan-destroy init graph clean destroy

TERRAFORM_BIN := terraform

set_opts:
	$(eval AWS_DEFAULT_REGION = $(shell grep aws_region terraform.tfvars |cut -d\" -f2))
	$(eval ENVIRONMENT = $(shell grep environment terraform.tfvars |cut -d\" -f2))
	$(eval PROJECT = $(shell grep project terraform.tfvars |cut -d\" -f2))
	@true

help:
	@echo "Builds the $(PROJECT) $(ENVIRONMENT) infrastructure."
	@echo ""
	@echo "Targets:"
	@echo "	apply		Use Terraform to apply the desired changes to the AWS infrastructure."
	@echo "	clean		Remove any existing plan files and infrastructure graphs."
	@echo "	deps		Check if the required dependencies have been correctly configured."
	@echo "	destroy		Destroy the Terraform managed infrastructure"
	@echo "	graph		Produce a graphical image of the infrastructure managed by Terraform."
	@echo "	help		Prints this help text."
	@echo "	plan		Show the changes that Terraform is planning to make when apply is run."
	@echo "	plan-destroy	Generate an execution plan to destroy all resources"
	@echo "	refresh		Reconcile the current state with the statefile."

almost: set_opts init plan

deps:
	@test -n $(TERRAFORM_BIN) || \
		(echo "Install terraform to continue"; exit 1)
	@test -n "$(AWS_ACCESS_KEY_ID)" || \
		(echo "AWS_SECRET_KEY_ID environment variable not set"; exit 1)
	@test -n "$(AWS_SECRET_ACCESS_KEY)" || \
		(echo "AWS_SECRET_ACCESS_KEY environment variable not set"; exit 1)

clean: set_opts
	@echo "Removing $(PROJECT)_$(ENVIRONMENT).png"
	@rm -f $(PROJECT)_$(ENVIRONMENT).png
	@echo "Remoging $(AWS_DEFAULT_REGION).tfplan"
	@rm -f $(AWS_DEFAULT_REGION).tfplan
	@echo "Removing .terraform/terraform.tfstate"
	@rm .terraform/terraform.tfstate
	@echo "Removing .init.txt"
	@rm .init.txt

graph: set_opts
	@test -n dot || \
		(echo "Graphviz must be installed to use graphing functionality, please install from http://www.graphviz.org/."; exit 1)
	@$(TERRAFORM_BIN) graph | dot -Tpng > $(PROJECT)_$(ENVIRONMENT).png
	@echo "Graph produced as $(PROJECT)_$(ENVIRONMENT).png"

plan: deps set_opts
	@if [ ! -f .init.txt ] ; \
	then \
		echo "Please run make init first."; \
		exit 1; \
		fi;
	@echo "Running terraform remote pull"
	@$(TERRAFORM_BIN) remote pull;
	@echo "Running terraform get -update"
	@$(TERRAFORM_BIN) get -update;
	@echo "Running terraform plan"
	@$(TERRAFORM_BIN) plan \
		-out="$(AWS_DEFAULT_REGION).tfplan" \

plan-destroy: deps set_opts
	@if [ ! -f .init.txt ] ; \
	then \
		echo "Please run make init first."; \
		exit 1; \
	fi;
	@$(TERRAFORM_BIN) plan -destroy \
		-out="$(AWS_DEFAULT_REGION).tfplan"

apply: deps set_opts
	@if [ ! -f $(AWS_DEFAULT_REGION).tfplan ] ; \
	then \
		echo "Please run make plan first to generate an execution plan."; \
		exit 1; \
	fi;
	@if [ ! -f .init.txt ] ; \
	then \
		echo "Please run make init first."; \
		exit 1; \
		fi;
	@echo "Running terraform apply"
	@$(TERRAFORM_BIN) apply \
		$(AWS_DEFAULT_REGION).tfplan
	@rm $(AWS_DEFAULT_REGION).tfplan
	@echo "Running terraform remote push"
	@$(TERRAFORM_BIN) remote push

destroy: deps set_opts
	@echo "Running terraform destroy"
	@$(TERRAFORM_BIN) destroy
	@echo "Running terraform remote push"
	@$(TERRAFORM_BIN) remote push

refresh: deps
	@if [ ! -f .init.txt ] ; \
	then \
		echo "Please run make init.txt first."; \
		exit 1; \
	fi;
	@echo "Running terraform remote pull"
	@$(TERRAFORM_BIN) remote pull
	@echo "Running terraform refresh"
	@$(TERRAFORM_BIN) refresh

init: deps set_opts
	@echo "Initializing remote state file"
	@echo "S3 bucket is terraform-state.$(PROJECT).$(ENVIRONMENT).$(AWS_DEFAULT_REGION)"
	@echo "Running terraform remote config"
	#@s3cmd mb s3://terraform-state.$(PROJECT).$(ENVIRONMENT).$(AWS_DEFAULT_REGION)
	@terraform remote config -backend s3 \
		-backend-config="bucket=terraform-state.$(PROJECT).$(ENVIRONMENT).$(AWS_DEFAULT_REGION)" \
		-backend-config="key=terraform.tfstate" \
		-backend-config="region=$(AWS_DEFAULT_REGION)"
	@echo "ran terraform remote config. Configured remote state storage in S3 bucket terraform-state.$(PROJECT).$(ENVIRONMENT).$(AWS_DEFAULT_REGION)" > .init.txt
