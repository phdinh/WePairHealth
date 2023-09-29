import React, { Fragment, useCallback, useState } from "react";
import { Button } from "react-bootstrap";
import { useDropzone } from "react-dropzone";
import filesService from "services/filesService";
import PropTypes from "prop-types";
import "./files.css";
import toastr from "toastr";

function FileUpload({ handleUploadSuccess, isMultiple })
{

  const [fileAmount, setFileAmount] = useState(0);

  const onDrop = useCallback((acceptedFiles) =>
  {
    handleUpload(acceptedFiles);
    setFileAmount((prevState) => prevState.length);
  }, []);

  const { getRootProps, getInputProps, isDragActive, acceptedFiles } =
    useDropzone({
      onDrop,
      accept: ".jpeg, .pdf, .txt, .docx, .png, .mp4",
      multiple: isMultiple,
    });

  const handleUpload = async () =>
  {
    if (acceptedFiles.length > 0)
    {
      const data = new FormData();
      acceptedFiles.forEach((file) =>
      {
        data.append(`file`, file);
      });

      await onUploadClicked(data);
    }
  };

  const onUploadClicked = (formData) =>
  {
    filesService
      .upload(formData)
      .then(onUploadFileSuccess)
      .catch(onUploadFileError);
  };

  const onUploadFileSuccess = (response) =>
  {
    if (response && response.Item !== null)
    {
      handleUploadSuccess(response);
    } else
    {
      toastr.error("unable to send form data to client");
    }
  };

  const onUploadFileError = (error) =>
  {
    toastr.error("file upload error handler", error);
  };

  return (
    <Fragment>
      <div className="file-upload-container">
        <div {...getRootProps({ className: "dropzone" })}>
          <input className="input-zone" {...getInputProps()} />
          {isDragActive ? (
            <p>Drop Files here...</p>
          ) : (
            <p>
              Drag and Drop some file here
              <span className="drag-box-number">
                {fileAmount > 0 &&
                  `(${fileAmount} file${fileAmount > 1 ? "s" : ""} added)`}
              </span>
            </p>
          )}
        </div>
        <Button onClick={handleUpload}>Upload File</Button>
      </div>
    </Fragment>
  );
}

FileUpload.propTypes = {
  handleUploadSuccess: PropTypes.func.isRequired,
  isMultiple: PropTypes.bool.isRequired,
};

export default FileUpload;
