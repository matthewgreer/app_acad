export const fetchLaughs = () => {
    // debugger
    return $.ajax({
        method: 'GET',
        url: '/api/laughs'
    })
}

export const createLaugh = (laugh) => {
    // debugger
    return $.ajax({
        method: 'POST',
        url: '/api/laughs',
        data: { laugh: laugh }
    })
}

export const fetchLaugh = id => {
  return $.ajax({
    method: 'GET',
    url: `/api/laughs/${id}`
  });
};