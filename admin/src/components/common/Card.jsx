import React from 'react';

const Card = ({ children, className = '' }) => (
  <div className={`bg-white rounded-2xl shadow-sm border border-neutral-100 ${className}`}>
    {children}
  </div>
);

export default Card;
