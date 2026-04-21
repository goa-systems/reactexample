# Example React

## Project setup

### Node

The project requires [NodeJS](https://nodejs.org) installed and the commands `node`, `npm` and `npx` available in the PATH.

### Prepare frontend

To install [React](https://react.dev) dependencies go to `src/main/react` and run `npm install`.

### Run frontend development server

Go to `src/main/react` and run `npm run dev`.

### Build frontend

Go to `src/main/react` and run `npm run build`.

### Build project

Go to the root folder and run `./gradlew integrateFrontend build`.

## Project configuration

### SystemD

Used for application control.

```
gsdo/config/systemd/reactexample.service
```

### Polkit

Used for allowing a user to control the service.

```
gsdo/config/polkit/01-reactexample.rules
```