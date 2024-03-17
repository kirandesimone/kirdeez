defmodule KirdeezWeb.HomeLive do
  use KirdeezWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="grid">
      <section>
        <div class="flex flex-col space-y-4">
          <h2 class="text-3xl text-mint font-bold">About</h2>
          <p class="text-whiteSmoke text-lg">
            Just a man with a Rachel and a Nanuk.<br/>
            I try to code things in C, Rust, and Elixir but idk what I'm doing.<br/>
            Also, I try to write about the things I learn along the way, called Whatcha-Ma-Callems. <br/>
            I currently work at PNC Bank as a glorified help desk person (App Support Specialist).
          </p>
          <p class="text-whiteSmoke text-lg">And if you're wondering the answer is yes... I did try to buy kirdeez.nuts</p>
        </div>
      </section>
      <hr class="my-12 h-px border-t-0 bg-transparent bg-gradient-to-r from-transparent via-neutral-500 to-transparent opacity-25 dark:via-neutral-400"/>
      <section>
        <.link navigate={~p"/whatchamacallems"}>
          <div class="relative px-5 py-14 overflow-hidden font-bold text-3xl flex justify-center border border-none rounded-lg group">
            <span class="absolute top-0 left-0 w-0 h-0 transition-all duration-200 border-t-2 border-mint group-hover:w-full ease"></span>
            <span class="absolute bottom-0 right-0 w-0 h-0 transition-all duration-200 border-b-2 border-mint group-hover:w-full ease"></span>
            <span class="absolute top-0 left-0 w-full h-0 transition-all duration-300 delay-200 bg-mint group-hover:h-full ease"></span>
            <span class="absolute bottom-0 left-0 w-full h-0 transition-all duration-300 delay-200 bg-mint group-hover:h-full ease"></span>
            <span class="absolute inset-0 w-full h-full duration-300 delay-300 bg-mint opacity-0 group-hover:opacity-100"></span>
            <span class="relative text-mint transition-colors duration-300 delay-200 group-hover:text-bGray ease">
              Whatcha-Ma-Callems
            </span>
          </div>
        </.link>
        <p class="pt-4 text-whiteSmoke"> (I stole this cool effect from someone online) </p>
      </section>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      socket
    {:ok, socket}
  end
end
