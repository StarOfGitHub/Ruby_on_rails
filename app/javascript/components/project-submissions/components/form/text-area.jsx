import React from 'react';
import { object, func, string, bool } from 'prop-types';

const TextArea = ({ name, register, errors, rows, autoFocus, placeholder, dataTestId }) => {
  const styles = () => (
    errors[name]
      ? 'pr-10 border-red-300 text-red-900 placeholder-red-400 focus:ring-red-500 focus:border-red-500'
      : 'border-gray-300 focus:ring-indigo-500 focus:border-indigo-500 dark:border-gray-500 dark:focus:ring-gray-400 dark:focus:border-gray-400'
    );

  return (
    <div>
      <textarea
        autoFocus={autoFocus}
        placeholder={placeholder}
        className={`block w-full border rounded-md shadow-sm py-2 px-3 focus:outline-none dark:bg-gray-700/50 dark:placeholder-gray-400 ${styles()}`}
        rows={rows}
        data-test-id={dataTestId}
        {...register(name, {
          minLength: { value: 4, message: 'Must be at least 4 characters' },
          required: 'Required',
        })}
      />
      {errors[name] && (
        <div className="mt-2 text-sm text-red-600" data-test="error-message">
          {' '}
          {errors[name].message}
        </div>
      )}
    </div>
  );
};

TextArea.defaultProps = {
  autoFocus: false,
  placeholder: '',
  dataTestId: '',
}

TextArea.propTypes = {
  name: string.isRequired,
  register: func.isRequired,
  errors: object.isRequired,
  rows: string.isRequired,
  dataTestId: string,
  placeholder: string,
  autoFocus: bool,
};

export default TextArea;
