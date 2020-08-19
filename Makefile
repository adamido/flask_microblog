.DEFAULT_GOAL := help

# source: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world

export FLASK_APP=microblog.py
export FLASK_ENV=development

install-flask: ## Install necessary stuff: python3 python3-flask python3-pip ipython3
	apt install python3 python3-flask python3-pip ipython3

build-flask-docker: ## Build a docker image for this microblog
	docker build --tag flask_microblog:1.0 .

stop-microblog: ## stop microblog instance
	@echo "TBD"
	#$(MAKE) killall-flask &>/dev/null

run-microblog: ## run the microblog flask application
	flask run

list-routes: ## Show the routes of microblog
	flask routes

killall-flask: ## kills all running flask instances
	 killall -SIGTERM flask

###############################################################################
#--- Help section -------------------------------------------------------------
###############################################################################
help:
	@echo
	@echo "#$(LINE)"
	@printf "\033[37m%-30s\033[0m %s\n" "# Makefile targets                                                                      |"
	@echo "#$(LINE)"
	@printf "\033[37m%-30s\033[0m %s\n" "#-target-----------------------description-----------------------------------------------"
	@grep -E '^[a-zA-Z_-].+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo 

print-%  : ; @echo $* = $($*)
