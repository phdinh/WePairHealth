import React, { Fragment } from "react";
import FileUpload from "./FileUpload";
import toastr from "toastr";
function ExampleFileUpload() {

  const handleUploadSuccess = (files) => {
    toastr.success("sample files to test upload", files);
  };

  return (
    <Fragment>
      <h1>Example File Upload</h1>
      <FileUpload handleUploadSuccess={handleUploadSuccess} isMultiple={true} />
    </Fragment>
  );
}

export default ExampleFileUpload;
