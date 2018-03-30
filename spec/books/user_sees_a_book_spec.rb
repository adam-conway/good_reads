require 'rails_helper'

describe "User sees one book" do
  scenario "a user sees a book" do
    book = Book.create!(title: "This is a book title", )
    user = User.create!(name: "Adam")
    review = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)

    visit book_path(book)

    expect(current_path).to eq(book_path(book))
    expect(page).to have_content(book.title)
    expect(page).to have_content (review.body)
    expect(page).to have_content (review.user.name)
    expect(page).to have_content (review.rating)
  end
  scenario "a user sees a book average rating" do
    book = Book.create!(title: "This is a book title")
    user = User.create!(name: "Adam")
    review = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)
    review = user.reviews.create!(body: "This is a crappy book", rating: 15, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content (book.average_rating)
  end
  scenario "a user sees a books highest rating" do
    book = Book.create!(title: "This is a book title")
    user = User.create!(name: "Adam")
    review = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)
    review = user.reviews.create!(body: "This is a crappy book", rating: 15, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content ("Highest Rating: 15")
  end
  scenario "a user sees a books lowest rating" do
    book = Book.create!(title: "This is a book title")
    user = User.create!(name: "Adam")
    review = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)
    review = user.reviews.create!(body: "This is a crappy book", rating: 15, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content ("Lowest Rating: 5")
  end
  scenario "a user sees a books highest rating body and user" do
    book = Book.create!(title: "This is a book title")
    user = User.create!(name: "Adam")
    user2 = User.create!(name: "Daniel")
    review1 = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)
    review2 = user.reviews.create!(body: "This is a great book", rating: 15, book_id: book.id)
    review3 = user.reviews.create!(body: "This is a bad book", rating: 20, book_id: book.id)
    review4 = user2.reviews.create!(body: "This is a ok book", rating: 30, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content ("Highest rating body: #{review4.body}")
    expect(page).to have_content ("Highest rating user: #{review4.user.name}")
  end
  scenario "a user sees a books lowest rating body and user" do
    book = Book.create!(title: "This is a book title")
    user = User.create!(name: "Adam")
    user2 = User.create!(name: "Daniel")
    review1 = user.reviews.create!(body: "This is a crappy book", rating: 5, book_id: book.id)
    review2 = user.reviews.create!(body: "This is a great book", rating: 15, book_id: book.id)
    review3 = user.reviews.create!(body: "This is a bad book", rating: 20, book_id: book.id)
    review4 = user2.reviews.create!(body: "This is a ok book", rating: 30, book_id: book.id)

    visit book_path(book)
    # save_and_open_page

    expect(page).to have_content ("Lowest rating body: #{review1.body}")
    expect(page).to have_content ("Lowest rating user: #{review1.user.name}")
  end
end
