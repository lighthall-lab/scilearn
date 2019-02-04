jupyter nbconvert --execute notebooks/0.1.qualtrics-request.ipynb
jupyter nbconvert --execute notebooks/0.2.clean_qualtrics.ipynb
jupyter nbconvert --execute notebooks/0.3.clean_nback_procspeed.ipynb
jupyter nbconvert --execute notebooks/0.4.join_subject_level.ipynb

read -s -p Done