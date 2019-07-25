export const Increment='increment'
export const Decrement='decrement'

export const increment=(counterCaption)=>({
    type:Increment,
    counterCaption //这里可以没有:
  }
)
export const decrement=(counterCaption)=>({
    type:Decrement,
    counterCaption
})
