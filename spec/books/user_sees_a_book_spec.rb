require 'rails_helper'

describe "User sees one book" do
  scenario "a user sees a book" do
    book = Book.create!(title: "This is a book title", )
    user = User.create!(name: "Adam")
    review = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)

    visit book_path(book)
    # save_and_open_page

    expect(current_path).to eq(book_path(book))
    expect(page).to have_content(book.title)
    expect(page).to have_content (review.body)
    expect(page).to have_content (review.user.name)
    expect(page).to have_content (review.rating)
  end
end
