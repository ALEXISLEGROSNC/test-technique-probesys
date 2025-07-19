### DOCKER ###

build: ## Build uniquement les images Docker
	docker-compose build

up: ## Lancer les conteneurs Docker (+build si necessaire)
	docker-compose up --build

down: ## Arreter et supprimer les conteneurs
	docker-compose down

down-db: ## Supprimer les conteneurs et le volume de la base de donnees
	$(MAKE) down 
	docker-compose rm -f
	docker volume rm probesys_db_data || true

start: ## Demarrer les conteneurs (s'ils sont deja crees)
	docker-compose start

stop: ## Arreter les conteneurs sans les supprimer
	docker-compose stop

reset: ## Reinitialiser tout : stop, supprime, efface le volume DB, rebuild et relance 
	$(MAKE) down
	docker-compose rm -f
	docker volume rm probesys_db_data || true
	docker-compose up --build

### DOCKER INFO ###

logs: ## Afficher les logs en temps reel
	docker-compose logs -f

ps: ## Afficher l'etat des conteneurs
	docker-compose ps

### RAILS ###

seed: ## Executer les seeds Rails dans le conteneur web
	docker-compose exec web rails db:seed

migrate: ## Executer les migrations Rails dans le conteneur web
	docker-compose exec web rails db:migrate

console: ## Ouvrir une console Rails dans le conteneur web
	docker-compose exec web rails console

### TECHNIQUE ###

lint: ## Analyse statique du code Ruby/Rails avec RuboCop
	docker-compose run --rm web bundle exec rubocop

lint-correct: ## Analyse statique du code Ruby/Rails avec RuboCop + corrections automatiques lorsque c'est possible
	docker-compose run --rm web bundle exec rubocop -A

run-tests: ## Lance les tests unitaires avec RSPEC
	rspec --format documentation

### HELP ###

help: ## Afficher la documentation des deux commandes helplin et helpwin
	@echo ""
	@echo "Pour afficher la documentation, utilisez l'une des commandes suivantes :"
	@echo "  - make helplin (pour Linux)"
	@echo "  - make helpwin (pour Windows)"
	@echo ""

helplin: ## Afficher la documentation (LINUX)
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .+$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""

helpwin: ## Afficher la documentation (WINDOWS)
	@echo ""
	@findstr /R /C:"^[a-zA-Z_-]*:.*##" Makefile
	@echo ""