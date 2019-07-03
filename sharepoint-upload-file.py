#
#    A script to upload files to sharepoint!
#
#    Run by navigating to directory containing upload file, then execute:
#    python3 /PATH/TO/sharepoint-upload-file.py FILENAME.ext
#
#    REQUIRMENTS TO RUN:
#      - Python 3 (tested using 3.7.3)
#      - Requests Python Library ( https://2.python-requests.org/en/master/ )
#      - Sharepy Python Library ( https://pypi.org/project/sharepy/ )
#
#    NOTE: Login credentials should match your office 365 login (first.last@aerisllc.com)
#

import sharepy
import requests
import sys
import shutil
import os
from requests_toolbelt import MultipartEncoder

# edit these to change the upload destination
siteURL = "aerisllc.sharepoint.com"
spfoldername = "Shared%20Documents/APITest/"

filename = sys.argv[1]
localFileSize = os.stat(filename).st_size

s = sharepy.connect(siteURL)

headers = {
    "accept": "application/json;odata=verbose",
    "content-type": "multipart/form-data",
    "content-length": str(localFileSize),
    "connection": "keep-alive",
    "X-RequestDigest": s._redigest(),
    "X-FORMS_BASED_AUTH_ACCEPTED": "f",
    "If-Match": "*",
    "Authorization": "Bearer " + s._redigest(),
}

m = MultipartEncoder(fields={(filename, open(filename, "rb"))})
p = s.post(
    "http://aerisllc.sharepoint.com/_api/web/getfolderbyserverrelativeurl('"
    + spfoldername
    + "')/Files/add(url='"
    + filename
    + "',overwrite=true)",
    data=m,
    headers=headers,
)
print(p)
