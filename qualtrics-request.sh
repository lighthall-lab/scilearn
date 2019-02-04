curl -X POST -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' -d '{"format":"csv"}' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bsl9vF012E6Thbv/export-responses'

curl -X POST -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' -d '{"format":"csv"}' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bBNxUVhoGFcyKot/export-responses'

curl -X POST -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' -d '{"format":"csv"}' 'https://ucf.qualtrics.com/API/v3/surveys/SV_2gAX1ty1UjOeKBT/export-responses'

curl -X POST -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' -d '{"format":"csv"}' 'https://ucf.qualtrics.com/API/v3/surveys/SV_d4o0ZLBDB8GxpwV/export-responses'

curl -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bsl9vF012E6Thbv/export-responses/ES_9NVGSR3pxoMlgH3'

curl -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bBNxUVhoGFcyKot/export-responses/ES_9NVGSR3pxoMlgH3'

curl -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' 'https://ucf.qualtrics.com/API/v3/surveys/SV_2gAX1ty1UjOeKBT/export-responses/ES_9NVGSR3pxoMlgH3'

curl -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' -H 'Content-Type: application/json' 'https://ucf.qualtrics.com/API/v3/surveys/SV_d4o0ZLBDB8GxpwV/export-responses/ES_9NVGSR3pxoMlgH3'

curl -X GET -H "Content-Type: application/json" -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bsl9vF012E6Thbv/export-responses/eb954c76-9da5-45fe-8a25-e70eabce838b/file' -o responses.zip

curl -X GET -H "Content-Type: application/json" -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' 'https://ucf.qualtrics.com/API/v3/surveys/SV_bBNxUVhoGFcyKot/export-responses/eb954c76-9da5-45fe-8a25-e70eabce838b/file' -o responses.zip

curl -X GET -H "Content-Type: application/json" -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' 'https://ucf.qualtrics.com/API/v3/surveys/SV_2gAX1ty1UjOeKBT/export-responses/eb954c76-9da5-45fe-8a25-e70eabce838b/file' -o responses.zip

curl -X GET -H "Content-Type: application/json" -H 'X-API-TOKEN: YFZlFTjmVeOR5paiFVNEN3dq5sVc4lkNeUX8tPn9' 'https://ucf.qualtrics.com/API/v3/surveys/SV_d4o0ZLBDB8GxpwV/export-responses/eb954c76-9da5-45fe-8a25-e70eabce838b/file' -o responses.zip
