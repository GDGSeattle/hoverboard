## Committing to gdgseattle/hoverboard

1. Setup steps:

  - Create a `serviceAccountProd.json` and `serviceAccountStaging.json` files.
    
    - Go to https://console.firebase.google.com/project/devfest18-e1a40/settings/serviceaccounts/adminsdk and download the json file. Change the download file name to serviceAccountProd.json.
    - For staging, go to https://console.firebase.google.com/project/devfest18-e1a40/settings/serviceaccounts/adminsdk. Rename this file to serviceAccountStaging.json. The credentials are required to update the database with the `npm run firestore:init:staging` command.
  - Log into Firebase with gdg seattle credentials:

    ```
    npm i -g firebase-tools
    firebase login
    ```

  - Install node 8 at the max. (Node 10 ran into some errors).

2. Fork the gdgseattle/hoverboard project and create a branch from develop. Add the upstream as git@github.com:gdgseattle/hoverboard

3. Edit content files:

  - data/cod.md
  - data/faq.md
  - data/resources.json
  - data/settings.json
  - docs/default-firebase-data.json

4. Test out content by deploying to staging with `./gdgseattle/deploy_staging.sh`

    ```
    cp serviceAccountStaging.json serviceAccount.json
    npm run firestore:init:staging
    npm run build:staging
    firebase deploy --project devfest-5e732
   ```

5. Create a pull request against the dev branch. commits should follow the following,  where X = the component changed, Y = a description, Z = notes about steps done to accomplish Y:

    ```
    gdgseattle(X): Y

    - Z note
    - Z note
    ```


## Instructions to deploy to prod and updating gdgseattle's master branch

1. Deploying to prod with `./gdgseattle/deploy_prod.sh`:

    ```
    npm run firestore:init:prod
    npm run build:prod
    firebase deploy --project devfest18-e1a40
    ```

2. Getting gdgseattle to sync up with all forks

    ```
    // set up the remotes

    git remote add upstream git@github.com:gdgseattle/hoverboard
    git remote add upupstream git@github.com:gdg-x/hoverboard

    // update upupstream and upstream

    git checkout master
    git pull upupstream master
    git push origin master
    git push upstream master

    // update develop from upstream and rebase master

    git checkout develop
    git pull upstream develop
    git rebase master
    git push upstream develop
    git push origin develop
    ```

## Deployment notes:

Additional deployment notes describing items changed in deployment.

* Edited package.json script. This will blow away the firestore to use the devfest18 project

  ```
  npm run firestore:init

  // Also updated this to be:
  npm run firebase:init:prod
  ```

  from
  ```
  firebase firestore:delete -r --all-collections && babel-node ./internals/import-default-data
  ```

  to
  ```
  firebase firestore:delete -r --all-collections --project devfest18-e1a40 && babel-node ./internals/import-default-data
  ```
