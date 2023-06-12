/* eslint camelcase: ["error", {ignoreDestructuring: true, properties: "never"}] */
import React, { useState, useContext } from 'react';
import PropTypes from 'prop-types';

import axios from '../../../src/js/axiosWithCsrf';
import ProjectSubmissionContext from '../ProjectSubmissionContext';
import {
  SubmissionsList,
  Modal,
  CreateForm,
  FlagForm,
} from '../components';

const ProjectSubmissions = ({ submissions, userSubmission }) => {
  const { userId, lesson, course } = useContext(ProjectSubmissionContext);

  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showFlagModal, setShowFlagModal] = useState(false);
  const [projectSubmissions, setProjectSubmissions] = useState(submissions);
  const [flaggedSubmission, setFlaggedSubmission] = useState({});
  const [userProjectSubmission, setUserProjectSubmission] = useState(userSubmission);

  const toggleShowFlagModal = () => setShowFlagModal((prevShowFlagModal) => !prevShowFlagModal);

  const toggleShowCreateModal = () => {
    setShowCreateModal((prevShowCreateModal) => !prevShowCreateModal);
  };

  const handleCreate = async (data) => {
    const { repo_url, live_preview_url, is_public } = data;

    const response = await axios.post(
      '/project_submissions',
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        },
      },
    );
    if (response.status === 200) {
      setUserProjectSubmission(() => response.data);
    }
  };

  const handleUpdate = async (data) => {
    const { repo_url, live_preview_url, is_public } = data;

    const response = await axios.put(
      `/project_submissions/${data.id}`,
      {
        project_submission: {
          repo_url,
          live_preview_url,
          is_public,
          lesson_id: lesson.id,
        },
      },
    );
    if (response.status === 200) {
      setUserProjectSubmission(() => response.data);
    }
  };

  const handleDelete = async (id) => {
    const response = await axios.delete(`/project_submissions/${id}`, {});
    if (response.status === 200) {
      setUserProjectSubmission(() => null);
    }
  };

  const handleFlag = async (data) => {
    const { reason } = data;

    const response = await axios.post(
      `/project_submissions/${data.project_submission_id}/flags`,
      { reason },
    );
    if (response.status === 200) {
      setFlaggedSubmission({});
    }
  };

  const toggleLikeSubmission = async (submission, isUserSubmission = false) => {
    const response = await axios.post(
      `/project_submissions/${submission.id}/likes`,
      {
        submission_id: submission.id,
        is_liked_by_current_user: submission.is_liked_by_current_user,
      },
    );

    if (response.status === 200) {
      const updatedSubmission = response.data;

      if (isUserSubmission) {
        setUserProjectSubmission(() => updatedSubmission);
      } else {
        setProjectSubmissions((prevSubmissions) => {
          const newSubmissions = prevSubmissions.map((prevSubmission) => {
            if (updatedSubmission.id === prevSubmission.id) {
              return updatedSubmission;
            }

            return prevSubmission;
          });

          return newSubmissions;
        });
      }
    }
  };

  return (
    <div className="mb-8 text-left">
      <div className="flex flex-col space-y-6 justify-between items-center pb-8 text-center md:space-y-0 md:text-left md:flex-row">
        <div className="flex md:flex-start flex-col space-y-1">
          <h3 className="text-4xl font-medium" id="solutions">Solutions:</h3>
          <h4 data-test-id="course-lesson-title" className="text-xl text-gray-500 dark:text-gray-400">
            {course.title}
            : (
            {lesson.title}
            )
          </h4>
        </div>
        <div>
          { !userProjectSubmission && (
            <button
              type="button"
              className="button button--primary"
              onClick={toggleShowCreateModal}
              data-test-id="add_submission_btn"
            >
              Add Solution
            </button>
          )}
        </div>
        <Modal show={showCreateModal} handleClose={toggleShowCreateModal}>
          <CreateForm
            lessonId={lesson.id}
            onSubmit={handleCreate}
            onClose={toggleShowCreateModal}
            userId={userId}
          />
        </Modal>
        <Modal show={showFlagModal} handleClose={toggleShowFlagModal}>
          <FlagForm
            submission={flaggedSubmission}
            onSubmit={handleFlag}
            onClose={toggleShowFlagModal}
            userId={userId}
          />
        </Modal>
      </div>
      <SubmissionsList
        submissions={projectSubmissions}
        userSubmission={userProjectSubmission}
        handleUpdate={handleUpdate}
        onFlag={(submission) => { setFlaggedSubmission(submission); toggleShowFlagModal(); }}
        handleDelete={handleDelete}
        handleLikeToggle={toggleLikeSubmission}
      />
    </div>
  );
};

ProjectSubmissions.defaultProps = {
  userSubmission: null,
};

ProjectSubmissions.propTypes = {
  submissions: PropTypes.array.isRequired,
  userSubmission: PropTypes.object,
};

export default ProjectSubmissions;
