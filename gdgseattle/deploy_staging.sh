#!/bin/bash
cp serviceAccountStaging.json serviceAccount.json
npm run firestore:init:staging
npm run build:staging
firebase deploy --project devfest-5e732