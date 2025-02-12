// import s from "./TalentsList.module.scss";
// import { TalentCard } from "./components/TalentCard";


// export function TalentsList({ talents = [] }) {
// 	return (
// 		<div className={s.talents_list}>
// 			{talents.map((talent) => (
// 				<TalentCard key={talent.id} talent={talent} />
// 			))}
// 		</div>
// 	);
// }

// TalentsList.jsx
import React, { useState, useEffect } from 'react';
import s from "./TalentsList.module.scss";
import { TalentCard } from "./components/TalentCard";

export function TalentsList() {
  const [talents, setTalents] = useState([]);

  useEffect(() => {
    fetch('/api/talents') // Adjust the endpoint as needed
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => setTalents(data))
      .catch(error => console.error('Error fetching talents:', error));
  }, []);

  return (
    <div className={s.talents_list}>
      {talents.map((talent) => (
        <TalentCard key={talent.id} talent={talent} />
      ))}
    </div>
  );
}
