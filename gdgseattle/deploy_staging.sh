#!/bin/bash

npm run firestore:init:staging
npm run build:staging
firebase deploy --project devfest-5e732