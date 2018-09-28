#!/bin/bash

npm run firestore:init:prod
npm run build:prod
firebase deploy --project devfest18-e1a40