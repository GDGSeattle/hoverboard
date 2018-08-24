## Created `serviceAccount.json`

Going to  https://console.firebase.google.com/project/devfest18-e1a40/settings/serviceaccounts/adminsdk and downloading a json file. Change the download file name to serviceAccount.json.


## Firebase login

Firebase login:
```
npm i -g firebase-tools

firebase login
```


## Deployment:

Additional deployment notes.

* Use node 8...node 10 does not work.

* Edited package.json script. This will blow away the firestore.

  ```
  npm run firestore:init
  ```

  from
  ```
  firebase firestore:delete -r --all-collections && babel-node ./internals/import-default-data
  ```

  to
  ```
  firebase firestore:delete -r --all-collections --project devfest18-e1a40 && babel-node ./internals/import-default-data
  ```

* Deploying requires building with:

  ```
  npm run build:prod
  firebase deploy --project devfest18-e1a40
  ```